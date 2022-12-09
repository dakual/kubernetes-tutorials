With Terraform
```h
resource "kubernetes_secret" "name" {
  metadata {
    name = var.registry_secret_name
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${var.registry_server}" = {
          "username" = var.registry_username
          "password" = var.registry_password
          "auth"     = base64encode("${var.registry_username}:${var.registry_password}")
        }
      }
    })
  }
}
```

With kubectl
```sh
kubectl create secret docker-registry <name> --docker-server=<server>--docker-username=<user-name> --docker-password=<password>
```

Usage in k8s manifest
```sh
imagePullSecrets:
  - name: <name> 
```