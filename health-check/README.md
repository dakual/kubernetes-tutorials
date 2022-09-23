### Types of health checks:
- Readiness probes: This probe will tell you when your app is ready to serve traffic. Kubernetes will ensure the readiness probe passes before allowing a service to send traffic to the pod. If the readiness probe fails, Kubernetes will not send the traffic to the pod until it passes.
- Liveness probes: Liveness probes will let Kubernetes know whether your app is healthy. If your app is healthy, Kubernetes will not interfere with pod functioning, but if it is unhealthy, Kubernetes will destroy the pod and start a new one to replace it.

### There are three types of probes:
- HTTP (httpGet)
- TCP (tcpSocket)
- Command (exec command)
- gRPC (grpc)

### Common
- initialDelaySeconds
- periodSeconds
- timeoutSeconds
- successThreshold
- failureThreshold: