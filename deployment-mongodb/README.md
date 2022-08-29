```sh
kubectl exec deployment/mongo-client -it -- /bin/bash
mongo --host mongo-nodeport-svc --port 27017 -u username -p password
show dbs
use db1
show collections
db.blogs.insert({name: "devopscube" })
db.blogs.find()
```