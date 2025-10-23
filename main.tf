# This block tells Terraform which providers to use
# We are using AWS provider at version 6.x
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configuring AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Security group to allow web traffic on port 80
resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP traffic"

  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # open to all
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # allow all outbound
  }
}

# EC2 instance running Amazon Linux 2
resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI in us-east-1
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web_sg.name]


  # Install Nginx at boot
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
	      amazon-linux-extras enable nginx1
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "nginx-server"
  }
}

# Output Public IP
output "server_ip" {
  value = aws_instance.web.public_ip
}
