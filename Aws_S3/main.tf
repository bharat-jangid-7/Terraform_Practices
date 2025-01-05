provider "aws" {
region = "us-east-2"
}

  resource "aws_s3_bucket" "my_bucket" {
    bucket = "my-tf-test-bucket"

    tags = {
      Name        = "My bucket"
      Environment = "Dev"
    } 

}
 
 # bucket versioning

resource "aws_s3_bucket_versioning" "my_bucket_versioning" { 
  bucket = aws_s3_bucket.my_bucket.bucket

 versioning_configuration {
  status = "Enabled"
  }
}