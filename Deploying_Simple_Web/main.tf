provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "web_deploy" {
    ami           = "ami-036841078a4b68e14"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.web_sg.id]
    tags = {
        Name = "web_deploy-instance"
    }

    user_data = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt install nginx -y
    echo "<h1> Hello, Everyone, This Simple Web app Deployed via Terraform </h1>" | sudo tee /var/www/html/index.html
    sudo systemctl enable nginx
    sudo systemctl start nginx
    EOF
}

resource "aws_security_group" "web_sg" {
    name_prefix = "web_sg"

# for ssh and http
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

# for all traffic

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}