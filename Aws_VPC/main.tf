# Define VPC 

resource "aws_vpc" "terraform_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "terraform_vpc"
  }
}

# Define Public Subnet

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.terraform_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-2a"
    map_public_ip_on_launch = true
    tags = {
        Name = "public_subnet"
    }
}

# Define Private Subnet

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.terraform_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-2a"
    tags = {
      Name = "private_subnet"
    }
}

# Define Internet Gateway

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.terraform_vpc.id
    tags = {
      Name = "terraform_igw"
    }
}

# Define Route Table

resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.terraform_vpc.id

    tags = {
        Name = "public_route_table"
    }  
}

# Define Route Table Association

resource "aws_route"  "public_route" {
    route_table_id = aws_route_table.public_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
    
}

# Define Subnet Association

resource "aws_route_table_association" "public_subnet_association" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_route_table.id
    
}

# Define Security Group 

resource "aws_security_group" "terraform_sg" {
    vpc_id = aws_vpc.terraform_vpc.id

# For HTTP and SSH access (Inbound rules)

    ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

# For all traffic (Outbound rules)

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
    }

    # Define EC2 Instance

    resource "aws_instance" "terraform" {
        ami = "ami-036841078a4b68e14"                # Ubuntu 20.04
        instance_type = "t2.micro"       
        subnet_id  = aws_subnet.public_subnet.id
        vpc_security_group_ids = [aws_security_group.terraform_sg.id] 
   }

    # Define Elastic IP

    resource "aws_eip" "nat_eip" {
        vpc = true
    }

    # Define NAT Gateway

    resource "aws_nat_gateway" "nat_gateway" {
        allocation_id = aws_eip.nat_eip.id
        subnet_id = aws_subnet.public_subnet.id
        tags = {
          Name = "nat_gateway"
        }
      
    }
