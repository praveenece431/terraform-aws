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

# AWS Credentials Configuration

To use the AWS CLI or AWS SDKs to interact with Amazon Web Services, you need to configure your AWS credentials. There are two common methods for setting AWS credentials: through the AWS credentials profile file or via environment variables.

## AWS Credentials Profile File

## You can store your AWS credentials in a profile file on your local system. The location of the file depends on your operating system:

- On Linux, macOS, or Unix, the file is located at `~/.aws/credentials`.
- On Windows, it can be found at `C:\Users\USERNAME\.aws\credentials`.

To configure the profile file:

1. Open the credentials file with a text editor:

   ```bash
   nano ~/.aws/credentials  # On Linux or macOS
   notepad C:\Users\USERNAME\.aws\credentials  # On Windows

## Add the following lines to the file, replacing <your_access_key_id> and <your_secret_access_key> with your own AWS credentials:

[default]
aws_access_key_id = <your_access_key_id>
aws_secret_access_key = <your_secret_access_key>

Environment Variables
Another way to set your AWS credentials is by using environment variables. You can set the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables.

To set these variables:

On Linux, macOS, or Unix, use the export command:
export AWS_ACCESS_KEY_ID=<your_access_key_id>
export AWS_SECRET_ACCESS_KEY=<your_secret_access_key>

On Windows, use the set command:
set AWS_ACCESS_KEY_ID=<your_access_key_id>
set AWS_SECRET_ACCESS_KEY=<your_secret_access_key>
