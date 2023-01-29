provider "aws" {
  region = "us-east-1"
  access_key = "test123"
  secret_key = "testabc"
  skip_credentials_validation = true
  skip_requesting_account_id = true
  skip_metadata_api_check = true
  s3_force_path_style = true
  endpoints {
    s3 = "http://localhost:4566"
  }
}

# Create Bucket
resource "aws_s3_bucket" "b" {
  bucket = "farshad"
  acl    = "public-read"
}