```sh
kubectl get namespaces --show-labels
kubectl get namespaces <name>
kubectl describe namespaces <name>

kubectl run <app-name> --image=<image> --port=<port>
kubectl expose pod <app-name> --name=<app-service-name>  --port=<port> --type=NodePort
kubectl get all -o wide
kubectl port-forward <pod-name> --address 0.0.0.0 <source>:<target>
```

## Minikube start
```sh
minikube start -n 3 -p <profile-name>
minikube profile list
minikube stop -p <profile-name>
minikume delete -p <profile-name>
```

### Minikube dashboard
```sh
minikube dashboard
```

### Run the following command: (for minikube)
```sh
minikube service <appname>
minikube service --url <appname>
minikube service --url <appname> -n <namespace>
```

## Creating a new namespace
Create a new YAML file called my-namespace.yaml with the contents:
```yml
apiVersion: v1
kind: Namespace
metadata:
  name: <namespace>
```
Then run:
```sh
kubectl create -f ./my-namespace.yaml
```

Alternatively, you can create namespace using below command:
```sh
kubectl create namespace <namespace>
```

## Assign Resource Quota To Namespace
Create a file named resourceQuota.yaml. Here is the resource quota YAML contents.
```yml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: mem-cpu-quota
  namespace: <namespace>
spec:
  hard:
    requests.cpu: "4"
    requests.memory: 8Gi
    limits.cpu: "8"
    limits.memory: 16Gi
```
Create the resource quota using the YAML.
```sh
kubectl create -f resourceQuota.yaml
```
Now, let’s describe the namespace to check
```sh
kubectl describe ns <namespace>
```

## Deleting a namespace
```sh
kubectl delete namespaces <namespace>
```

## Getting namespace logs
```sh
kubectl get events -n <namespace>
```

## Create a Deployment
```sh
kubectl create deployment <deployment-name> --image=k8s.gcr.io/echoserver:1.4
```

### Create pods in each namespace
```sh
kubectl create deployment <deployment-name> --image=k8s.gcr.io/sechoserver:1.4 -n=development --replicas=2
```

### View the Deployment:
```sh
kubectl get deployment
kubectl get deployment -n=<namespace>
kubectl get deployment <deployment-name> -n <namespace> --output yaml
```

### View the Pod:
```sh
kubectl get pods
kubectl get pods -w
kubectl get pods -n=<namespace>
kubectl get pods -l app=<appname> -n=<namespace>
kubectl get pods --all-namespaces 
kubectl get pods --all-namespaces -o wide
kubectl get pod <pod-name> -o yaml
kubectl get pods --show-labels
kubectl get pods --output=wide
watch -n 1 "kubectl get pods -o wide"
```

### Connecting Pod:
```sh
kubectl exec -it <pod-name> -- /bin/bash
kubectl exec <pod-name> cat /etc/resolv.conf  //Check Pod resolv.conf file to see
kubectl exec -ti <pod-name> -- nslookup kubernetes.default  //Check the Pod DNS
kubectl exec -it <multi-container-pod> -c <container-name> /bin/bash   //Login into the container
kubectl exec -it <pod-name> -- mysql -u root -p
```

### Delete Pod
```sh
kubectl delete pods --all --namespace <namespace>
```

## Scale deployment
```sh
kubectl scale deployment <node-name> --replicas=5 -n=<namespace>
```

### View the Node:
```sh
kubectl get nodes
```

### View cluster events:
```sh
kubectl get events
```

### View the kubectl configuration:
```sh
kubectl config view
```

## Create a Service
```sh
kubectl expose deployment <deployment-name> --type=LoadBalancer --port=<pod-port>
kubectl expose deployment <deployment-name> --type=NodePort --port=<pod-port>
```

### View the Service you created:
```sh
kubectl get services
kubectl describe service <service-name> -o json
```

### View the Pod and Service you created:
```sh
kubectl get pod,svc -n kube-system
```

### View the Pod logs:
```sh
kubectl logs <pod-name>
kubectl logs <pod-name> -c <container-name>
```

### View the Pod details:
```sh
kubectl describe pod <pod-name>
```

### Update the image of your Deployment:
```sh
kubectl set image deployment/hello-node hello-node=hello-node:v2
```

## Clean up
```sh
kubectl delete service <service-name>
kubectl delete deployment <deployment-name>
kubectl delete -f <yaml-file>
```

### context
```sh
kubectl config view
kubectı config get-context
kubectl config set-context <context-name> --namespace=<namespace-name> --user=kubernetes-admin --cluster=kubernetes
kubectl config use-context <context-name> 
kubectl config use-context kubernetes-admin@kubernetes
```

### nodeSelector
```sh
kubectl get nodes <node-name> --show-labels
kubectl label node <node-name> <label-name>=<label-value>
kubectl label node <node-name> <label-name>-
kubectl describe node <node-name>
```

### PersistentVolume for Storage
```sh
kubectl get pv <pv_name>  // View information about the PersistentVolume:
kubectl get pvc <pvc-name> 
kubectl describe pvc <pvc-name> 
kubectl describe pv <pv_name> 
```

### Secrets
```sh
kubectl create secret generic <secret-name> --from-literal=username=admin --from-literal=password=1234
kubectl describe secrets <secret-name>
kubectl get secret <secret-name> -o jsonpath='{.data.<key>}' | base64 --decode
kubectl get secrets <secret-name> -o yaml
echo '<value>' | base64
echo '<base64-value>' | base64 --decode
kubectl delete secret <secret-name>
```

### Configmap
```sh
kubectl create configmap <map-name> <data-source>
kubectl create configmap <configmap-name> --from-literal=demo=Hello-world
kubectl create configmap file-cm --from-file=config-files/
kubectl describe configmap <configmap-name>
kubectl get cm
kubectl get cm <configmap-name> -o yaml
```

```sh
kubectl run -it --restart=Never --rm --image busybox:1.28 dns-test
```