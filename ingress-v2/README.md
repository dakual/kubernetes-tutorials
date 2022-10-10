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
kubectl apply -f ingress-[path/host/ssl].yml
```

Verify the IP address is set
```sh
kubectl get ingress
```

Create SSL Certificate
```sh
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout host.key -out host.crt -config req.conf -extensions v3_req
```

Add SSL certificate to secret resource
```sh
kubectl create secret tls app-ssl --key host.key --cert host.crt
```

Add the following line to the bottom of the /etc/hosts file on your computer
```sh
172.17.0.15 example.com test.example.com prod.example.com
```

Verify that the Ingress controller is directing traffic
```sh
http://example.com/test1
http://example.com/test2

http://test.example.com
http://prod.example.com
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
kubectl logs <ingress-pod> -n <namespace>
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





