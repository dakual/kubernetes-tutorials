## Generate Certificates Manually
```sh
openssl genrsa -out ca.key 2048

openssl req -x509 -new -nodes -key ca.key -subj "/CN=example.com" -days 10000 -out ca.crt

openssl genrsa -out host.key 2048

openssl req -new -key host.key -out host.csr -config csr.conf

openssl x509 -req -in host.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out host.crt -days 10000 -extensions v3_ext -extfile csr.conf -sha256

openssl req  -noout -text -in ./host.csr

openssl x509  -noout -text -in ./host.crt
```

Adding the self-signed certificate as trusted
```sh
cp ca.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
```

Removing a certificate from the list of trusted ones
```sh
rm /usr/local/share/ca-certificates/ca.crt
sudo update-ca-certificates --fresh
```











