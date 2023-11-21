1- ## download Harbor installaer
```
wget https://github.com/goharbor/harbor/archive/refs/tags/v1.10.16.tar.gz
tar xvf v1.10.16.tar.gz
```


# 2- Get Certificate with Lets Encrypt 
```
 sudo certbot certonly --standalone --preferred-challenges http --agree-tos --email mrnickfetrat@gmail.com -d  hub.packops.dev
 
 ```
 
#  3- Configure Harbor

generate  certificate and add it in  harbor.yml
```
mkdir /opt/cert && cd /opt/cert

# Step 1: Generate a Private Key

openssl genpkey -algorithm RSA -out harbor.key

# Step 2: Generate a Certificate Signing Request (CSR)
openssl req -new -key harbor.key -out harbor.csr -subj "/CN=harbor.example.com"

# Step 3: Generate a Self-Signed Certificate
openssl x509 -req -days 365 -in harbor.csr -signkey harbor.key -out harbor.crt

# Step 4: Combine Key and Certificate into a PEM file
cat harbor.key harbor.crt > harbor.pem

```

```
https:
  # https port for harbor, default is 443
    port: 443
  # The path of cert and key files for nginx
    certificate: /opt/cert/harbor.crt
    private_key: /opt/cert/harbor.key



```


# 4  install docker 
```
sudo mkdir -p /etc/apt/keyrings

 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update &&  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose
```
# 5 Bring up harbor 

```
bash prepare
bash install.sh
```

``If you harbor is in Local make sure your domain name match with your server (make a host for you domain ) in my case 192.168.4.210 hub.packops.dev >> /etc/hosts ``

