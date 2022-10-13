## Setup RabbitMQ using Kubernetes Operator


Install the Cluster Operator using Helm.
```sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install rabbitmq-cluster-operator bitnami/rabbitmq-cluster-operator -n rabbitmq-system --create-namespace
```

Install the Cluster Operator directly using kubectl apply.
```sh
kubectl apply -f "https://github.com/rabbitmq/cluster-operator/releases/latest/download/cluster-operator.yml"
```

Now run the below command to see the resources deployed in rabbitmq-system namespace:
```sh
kubectl get all -n rabbitmq-system
```

Now that we have the Operator deployed, let's create the RabbitMQ Cluster.
```sh
kubectl apply -f rabbitmq-cluster.yaml
```

Let's check deployment.
```sh
kubectl get all --selector app.kubernetes.io/name=rabbitmqcluster-prod
```

Default secrets
```sh
kubectl get secret | grep rabbitmq
```

Access The Management UI. Default credentials for accessing the web UI
```sh
kubectl get secret rabbitmqcluster-prod-default-user -o jsonpath='{.data.username}' | base64 --decode

kubectl get secret rabbitmqcluster-prod-default-user -o jsonpath='{.data.password}' | base64 --decode

kubectl port-forward --address 0.0.0.0 svc/rabbitmqcluster-prod 15672:15672
```

Now we can open localhost:15672 in the browser and see the Management UI. The credentials are as printed in the commands above.

Alternatively, we can run a curl command to verify access:
```sh
username="$(kubectl get secret rabbitmqcluster-prod-default-user -o jsonpath='{.data.username}' | base64 --decode)"
echo "username: $username"

password="$(kubectl get secret rabbitmqcluster-prod-default-user -o jsonpath='{.data.password}' | base64 --decode)"
echo "password: $password"

kubectl port-forward --address 0.0.0.0 svc/rabbitmqcluster-prod 15672:15672

curl -u$username:$password localhost:15672/api/overview
```

## High Availability
RabbitMQ’s High Availability is achieved by mirroring the queues across different RabbitMQ Nodes in a cluster.


```sh
kubectl apply -f rabbitmq-ha.policy.yaml
```

<a href="https://www.rabbitmq.com/ha.html" target="_blank">https://www.rabbitmq.com/ha.html</a>


### Adding policy to replicate queues starting with “com”
Goto the “Admin” Section of the management centre and then click on the “Policies” on the right side. This will list all the policies currently setup ( which should be empty if you are doing this for the first time ). Now follow the below steps to add a policy

- Click on ‘Add / Update  a policy’
- Provide name as “ha-two-com-queues”
- Provide a pattern as “^com\.”
Now we need to specify the definition of the policy.
- In the first definition, put key as “ha-mode” and value as “exactly”
- In the second definition ( which will be automatically added below ), put key“ha-params” and value as “2”. Select the type as “Number” from the dropdown next to the fields.
- In the third definition, put key as “ha-sync-mode” and value as “automatic”
- Add the Policy ( Please note that all the values need to specified without the quotes )

Here we have specified policy and asked to apply it to queues starting with “com”. Our objective is to make sure that the queue is available in exactly 2 nodes in a cluster which is sync automatically. This is specified using the “ha-mode”, “ha-params” and “ha-sync-mode” fields.