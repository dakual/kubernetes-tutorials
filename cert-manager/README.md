### Deploy cert-manager
```sh
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.9.1/cert-manager.yaml
```

### Deploy cert-manager
```sh
kubectl create namespace cert-manager

helm repo add jetstack https://charts.jetstack.io
helm repo update

helm install certmgr jetstack/cert-manager \
    --set installCRDs=true \
    --version v1.9.1 \
    --namespace cert-manager
```

### Deploy the sample application
```sh
kubectl create namespace demo-app

kubectl apply -f deployment.yml   # application
kubectl apply -f ./staging        # for testing
kubectl apply -f ./prod           # for prod
```


```sh
# get CertificateRequests
kubectl get certificaterequest -n demo-app

# see the state of the request
kubectl describe certificaterequest some-certificaterequest-name -n demo-app

# check the Order
kubectl get order -n demo-app

kubectl describe order some-order-name -n demo-app

# check Challenge
kubectl get challenge -n demo-app

kubectl describe challenge some-challenge-name -n demo-app
```