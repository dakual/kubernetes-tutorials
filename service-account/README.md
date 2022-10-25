```sh
# Export the internal Kubernetes API server hostname
APISERVER=https://kubernetes.default.svc

# Export the path to ServiceAccount mount directory
SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount

# Read the ServiceAccount bearer token
TOKEN=$(cat ${SERVICEACCOUNT}/token)

# Reference the internal Kubernetes certificate authority (CA)
CACERT=${SERVICEACCOUNT}/ca.crt

# Make a call to the Kubernetes API with TOKEN
curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api/v1/namespaces/default/pods
```