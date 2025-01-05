# Variable for the EC2 instance 

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

# Variable for the S3 bucket

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}