# Outputs for the EC2 instance 

output "instance_id" {
  value = aws_instance.instance.id
  description = "ID of the EC2 instance"
}

output "instance_public_ip" {
  value = aws_instance.instance.public_ip
  description = "Public IP address of the EC2 instance"
}

# Outputs for the S3 bucket

output "bucket_id" {
  value = aws_s3_bucket.bucket.id
  description = "ID of the S3 bucket"
}

output "bucket_name" {
  value = aws_s3_bucket.bucket.bucket
  description = "Name of the S3 bucket"
  
}