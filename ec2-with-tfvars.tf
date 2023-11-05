# Define your provider (AWS)
provider "aws" {
  region = "us-east-1" # Replace with your desired region
}

############ Loading the tfvars file ###################
# locals {
#   tfvars = yamldecode(file("${path.module}/instances.tfvars"))
# }

# variable "instance_count" {
#   default = local.tfvars.instance_count
# }

# variable "instance_type" {
#   default = local.tfvars.instance_type
# }

# variable "key_name" {
#   default = local.tfvars.key_name
# }
##########################################

variable "instance_count" {
  description = "Number of EC2 instances to create"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "key_name" {
  description = "SSH key pair name"
}

# Create a security group
resource "aws_security_group" "my_sg" {
  name        = "poc-sg"
  description = "Learning with POCs"

  # Inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH access from anywhere
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP access from anywhere
  }

  # Outbound rules (optional)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_instance" {
  count         = var.instance_count
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = var.instance_type
  key_name      = var.key_name

  # Attach the security group
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  # Additional configuration (optional)
  # ...

  tags = {
    Name = "Terraform-provisioned ${count.index + 1}"
  }

  # Provisioners (optional)
  # ...
}
