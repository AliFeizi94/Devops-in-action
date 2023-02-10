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

add certificate in  harbor.yml
```
https:
  # https port for harbor, default is 443
    port: 443
  # The path of cert and key files for nginx
    certificate:  /etc/letsencrypt/live/hub.packops.dev/fullchain.pem
    private_key:  /etc/letsencrypt/live/hub.packops.dev/privkey.pem

```

# 4- Bring up harbor 

```
bash prepare.sh 
bash install.sh
```
