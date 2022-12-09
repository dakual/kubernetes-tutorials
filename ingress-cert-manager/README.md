Installing nginx ingress controller
```sh
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update

helm install my-release nginx-stable/nginx-ingress
```

Installing Cert-Manager
```sh
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.10.1/cert-manager.yaml
```

Installing Cert-Manager with helm
```sh
helm repo add jetstack https://charts.jetstack.io
helm repo update

helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --set installCRDs=true
  # --version v1.10.1 \
  # --set cert-manager.namespace=security
  # --values "cert-manager-values.yml" \
  # --wait
```



Deployment
```sh
kubectl apply -f k8s/app-deployment.yml
kubectl apply -f k8s/app-ingress.yml
```



Uninstalling
```sh
helm --namespace cert-manager delete cert-manager
kubectl delete namespace cert-manager
```

