```
echo $(awslocal dynamodb create-table --cli-input-json '{"TableName":"ItemInfo", "KeySchema":[{"AttributeName":"id","KeyType":"HASH"}], "AttributeDefinitions":[{"AttributeName":"id","AttributeType":"S"}],"BillingMode":"PAY_PER_REQUEST"}')
```
``` 
aws --endpoint-url=http://localhost:4566 --region=us-east-1 dynamodb scan --table-name ItemInfo
echo $(awslocal dynamodb list-tables)
```
