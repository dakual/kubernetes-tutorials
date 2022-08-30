### Affinity
So far, when we deployed any Pod in the Kubernetes cluster, it was run on any node that met the requirements (ie memory requirements, CPU requirements, …​)

However, in Kubernetes there are two concepts that allow you to further configure the scheduler, so that Pods are assigned to Nodes following some business criteria.