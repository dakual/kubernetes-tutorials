### Volumes & Persistent Volumes
Containers are ephemeral by definition, which means that anything that it is stored at running time is lost when the container is stopped. This might cause problems with containers that need to persist their data, like database containers.

A Kubernetes volume is just a directory that is accessible to the Containers in a Pod. The concept is similar to Docker volumes, but in Docker you are mapping the container to a computer host, whereas in the case of Kubernetes volumes, the medium that backs it and the contents of it are determined by the particular volume type used.

Some of the volume types are:
-----------------------------
- awsElasticBlockStore
- azureDisk
- cephfs
- nfs
- local
- empty dir
- host path


### EmptyDir
An emptyDir volume is first created when a Pod is assigned to a node and exists as long as that Pod is running on that node. As the name says, it is initially empty. All Containers in the same Pod can read and write in the same emptyDir volume. When a Pod is restarted or removed, the data in the emptyDir is lost forever.

### HostPath
A hostPath volume mounts a file or directory from the node’s filesystem into the Pod. 








