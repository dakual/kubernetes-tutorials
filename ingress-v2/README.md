Ingress controller is typically a proxy service deployed in the cluster.
To enable the NGINX Ingress controller
```sh
minikube addons enable ingress
```

Verify that the NGINX Ingress controller is running
```sh
kubectl get pods -n ingress-nginx
```

Create and Expose Deployment 
```sh
kubectl apply -f app-01.yml
kubectl apply -f app-02.yml
```

Verify the Service is created and is available on a node port
```sh
kubectl get service web
```

Create the Ingress object
```sh
kubectl apply -f ingress.yml
```

Verify the IP address is set
```sh
kubectl get ingress
```

Add the following line to the bottom of the /etc/hosts file on your computer
```sh
172.17.0.15 hello-world.info
```

Verify that the Ingress controller is directing traffic
```sh
http://hello-world.info/test1
http://hello-world.info/test2
```

## Troubleshooting
Ingress-Controller Logs and Events. 
There are many ways to troubleshoot the ingress-controller. The following are basic troubleshooting methods to obtain more information.

Check the Ingress Resource Event
```sh
kubectl get ingress -n <namespace>
kubectl describe ingress <ingress-name> -n <namespace>
```

Check the Ingress Controller Logs
```sh
kubectl get pods -n <namespace>
kubectl logs <ingress-pod> -n nginx-ingress
```

Check the Nginx Configuration
```sh
kubectl get pods -n <namespace>
kubectl exec -it -n <namespace> <ingress-pod> -- cat /etc/nginx/nginx.conf
```

Check if used Service and Deployment Exist
```sh
kubectl get svc -n <namespace>
kubectl get deploy -n <namespace>
```
