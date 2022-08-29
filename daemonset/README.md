### DaemonSets
A DaemonSet ensures that all nodes run a copy of a Pod. As nodes are added to the cluster, Pods are added to them automatically. When the nodes are deleted, they are not rescheduled but deleted.

So DaemonSet allows you to deploy a Pod across all nodes.