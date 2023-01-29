# Install localstack client 

```
python3 -m pip install localstack
```

# Bring up localstack docker-compose 
```
docker-compos up -d
```
# Config aws client 
```
apt install aws-client

aws config
```
![image](https://user-images.githubusercontent.com/88557305/215318895-9fdf2616-e5cb-4978-bef2-e303c2c59ae1.png)



# Create bucket with terraform 
copy main.tf
```
terraform apply
```
# OR
# Create buck with aws cli
```
aws --endpoint-url http://localhost:4566 s3api create-bucket --bucket my-bucket --region us-east-1
```

# upload Data in bucket
```
aws --endpoint-url http://localhost:4566 s3 cp sample.json s3://my-bucket/inner/sample.json --content-type 'application/json'
```