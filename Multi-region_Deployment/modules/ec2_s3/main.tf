# Launce an EC2 instance

resource "aws_instance" "instance" {
    ami = "ami-036841078a4b68e14"
    instance_type = "t2.micro"
    tags = {
        Name = var.instance_name
    }  
}

# Create an S3 bucket

resource "aws_s3_bucket" "bucket" {
    bucket = var.bucket_name
}