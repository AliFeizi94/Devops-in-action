1- ## download Harbor installaer
```
wget https://github.com/goharbor/harbor/archive/refs/tags/v1.10.16.tar.gz
tar xvf v1.10.16.tar.gz
```


# 2- Get Certificate with Lets Encrypt 
```
 sudo certbot certonly --standalone --preferred-challenges http --agree-tos --email mrnickfetrat@gmail.com -d  hub.packops.dev
 
 ```
 
#  3- Generate Certificate on Server 

generate  certificate and add it in  harbor.yml
```
kdir /opt/cert
cd /opt/cert

openssl genrsa -out ca.key 4096
openssl req -x509 -new -nodes -sha512 -days 3650 \
 -subj "/C=CN/ST=Beijing/L=Beijing/O=example/OU=Personal/CN=hub.packops.local" \
 -key ca.key \
 -out ca.crt
openssl genrsa -out hub.packops.local.key 4096
openssl req -sha512 -new \
    -subj "/C=CN/ST=Beijing/L=Beijing/O=example/OU=Personal/CN=hub.packops.local" \
    -key hub.packops.local.key \
    -out hub.packops.local.csr

cat > v3.ext <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1=hub.packops.local
DNS.2=hub.packops.local
DNS.3=hostname
EOF
openssl x509 -req -sha512 -days 3650 \
    -extfile v3.ext \
    -CA ca.crt -CAkey ca.key -CAcreateserial \
    -in hub.packops.local.csr \
    -out hub.packops.local.crt



```
# 4- Trust CA on Client 
```
mkdir -p /usr/local/share/ca-certificates/hub.packops.local/
openssl s_client -showcerts -connect hub.packops.local:443 </dev/null | openssl x509 -outform PEM > ca.crt

cp ca.crt /usr/local/share/ca-certificates/hub.packops.local/
update-ca-certificates
```
# 5- Add configs in harbor.yml
```
https:
  # https port for harbor, default is 443
    port: 443
  # The path of cert and key files for nginx
    certificate: /opt/cert/harbor.crt
    private_key: /opt/cert/harbor.key



```


# 6  install docker 
```
sudo mkdir -p /etc/apt/keyrings

 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update &&  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose
```
# 7 Bring up harbor 

```
bash prepare
bash install.sh
```

``If you harbor is in Local make sure your domain name match with your server (make a host for you domain ) in my case 192.168.4.210 hub.packops.dev >> /etc/hosts ``

