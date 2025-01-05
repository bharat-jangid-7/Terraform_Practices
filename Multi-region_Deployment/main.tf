# main.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  
  required_version = ">= 1.3.0"
}

# Define providers for multiple regions

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us_east_2"
  region = "us-east-2"
}

# Call module for US East-1 region

module "us_east_1_resources" {
  source        = "./modules/ec2_s3"
  providers     = { aws = aws.us_east_1 }
  bucket_name   = "multi-region-demo-us-east-1"
  instance_name = "us-east-1-instance"
}

# Call module for uS East-2 region

module "us_east_2_resources" {
  source        = "./modules/ec2_s3"
  providers     = { aws = aws.us_east_2 }
  bucket_name   = "multi-region-demo-eu-west-1"
  instance_name = "us-east-2-instance"
}
