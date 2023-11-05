# Define your provider (AWS)
provider "aws" {
  region = "us-east-1" # Replace with your desired region
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

# Create an EC2 instance
resource "aws_instance" "learning" {
  ami           = "ami-0fc5d935ebf8bc3bc" # Replace with your desired AMI ID
  instance_type = "t2.medium"
  key_name      = "login" # Replace with your SSH key pair name

  # Attach the security group
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  tags = {
    Name = "provisioned from terraform"
  }
  # Additional configuration (optional)
  # ...

  # Provisioners (optional)
  # ...
}
