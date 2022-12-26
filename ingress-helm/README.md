```sh
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx --create-namespace --version 4.4.0 \
  -f ingress.yml

helm install nginx-ingress ingress-nginx/ingress-nginx \
  --namespace ingress-nginx --create-namespace --version 4.4.0 \
  --set rbac.create=true \
  --set defaultBackend=false \
  --set controller.service.externalTrafficPolicy=Local \
  --set controller.scope.enabled=true \
  --set controller.scope.namespace=cloudbees-core
```             
