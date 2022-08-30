### Persistent Volume & Persistent Volume Claim
A PersistentVolume (PV) is a Kubernetes resource that is created by an administrator or dynamically using Storage Classes independently from the Pod. It captures the details of the implementation of the storage and can be NFS, Ceph, iSCSI, or a cloud-provider-specific storage system.

A PersistentVolumeClaim (PVC) is a request for storage by a user. It can request for a specific volume size or, for example, the access mode.

