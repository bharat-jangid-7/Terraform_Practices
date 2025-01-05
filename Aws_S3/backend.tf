
terraform { 
  backend "s3" { 
    bucket = "bharat-s3-backend"       # Name of the S3 bucket
    key = "tf/terraform.tfstate"
    region = "us-east-1"
  }
}