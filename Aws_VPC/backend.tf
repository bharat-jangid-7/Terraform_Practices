terraform {
    backend "s3" {
      bucket = "bharat-s3-backend" # Bucket name
      key = "terraform/terraform.tfstate" # Path to the state file inside the bucket
      region = "us-east-1"  # Region of the bucket
    }
}