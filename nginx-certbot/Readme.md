# 1-First of all Stop Nginx and request for a Certificate 
ACME Challenge : web (lets encrypt will request on your domain on port 80)
-d : your domain 
```
certbot certonly --standalone --preferred-challenges http --email mrnickfetrat@gmail.com --agree-tos -d  test.packops.dev
```

# 2- Configure your Virtual host and Determine a Certificate PATH 
## Change test.packops.dev to YOUR-DOMAIN.com
cp /etc/nginx/sites-enabled/test.packops.dev.conf /etc/nginx/sites-enabled/YOURDOMAIN.packops.dev.conf 

# 3- Check your configuration and start nginx 
```
nginx -t 
service nginx start
```
