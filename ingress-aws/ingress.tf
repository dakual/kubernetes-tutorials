resource "kubernetes_namespace" "nginx" {
  metadata {
    labels = {
      name = "ingress-nginx"
    }
    name = "ingress-nginx"
  }
}

resource "helm_release" "ingress-nginx" {
  name              = "ingress-nginx"
  repository        = "https://kubernetes.github.io/ingress-nginx"
  chart             = "ingress-nginx"
  namespace         = kubernetes_namespace.nginx.id
  version           = "4.4.0"
  create_namespace  = false
  timeout           = 300

  values = [
    "${file("./chart_values.yaml")}"
  ]

  depends_on = [
    kubernetes_namespace.nginx
  ]
}

resource "kubernetes_ingress_v1" "ingress" {
  wait_for_load_balancer = true
  
  metadata {
    name        = "monitoring-ingress"
    namespace   = "default"
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/$1"
      "nginx.ingress.kubernetes.io/ssl-redirect"   = "false"
    }
  }

  spec {
    ingress_class_name = "nginx"
    
    rule {
      host = "m1.kruta.link"
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "app-01-svc"
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    rule {
      host = "m2.kruta.link"
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "app-02-svc"
              port {
                number = 80
              }
            }
          }
        }
      }
    }   
  }
}

output "nginx-ingress-loadbalancer" {
  value = kubernetes_ingress_v1.ingress.status.0.load_balancer.0.ingress.0.hostname
}