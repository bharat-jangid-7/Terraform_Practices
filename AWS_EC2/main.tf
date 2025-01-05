provider "aws" {
  region = "us-east-1"
}

# Here  use the module ec2_instance and pass the values to the module.

module "ec2_instance" {               
  source = "./modules_(ec2_instance)" # path to the module
  ami_value = "ami-0e2c8caa4b6378d8c" # ami id
  instance_type_value = "t2.micro"    # instance type
  subnet_id_value = "subnet-08f4f1e04bbfbb749"   # subnet id
  key_name_value = "aws_login"        # key name
}