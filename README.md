# AWS CLI Configuration

Before you can use the AWS CLI to interact with Amazon Web Services, you need to configure it with your AWS credentials. Follow the steps below to set up AWS CLI on your system.

## Prerequisites

Make sure you have the following prerequisites installed:

- Update your package lists:

  ```bash
  sudo apt update
  sudo apt install -y awscli
  aws version
  aws configure

## Terraform commands
```bash
terraform init
terraform validate
terraform plan -var-file=ec2.tfvars
terraform apply -var-file=ec2.tfvars

