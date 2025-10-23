# SRE Intern Take-Home

This project provisions an AWS EC2 instance using Terraform and installs Nginx as a simple web server. The goal was to demonstrate Infrastructure as Code (IaC) concepts by automating the creation of a basic server setup.

## Project Overview

The Terraform configuration does the following:
- Creates a `t2.micro` EC2 instance (AWS Free Tier eligible).
- Uses the Amazon Linux 2 AMI in the `us-east-1` region.
- Runs a `user_data` script to install and start Nginx automatically.
- Creates a security group that allows inbound HTTP traffic on port 80.
- Outputs the public IP address of the instance for testing in a browser.

## Prerequisites

- An AWS account with Free Tier access.
- Terraform installed locally
- AWS CLI installed and configured with credentials

## Usage

Clone this repository and move into the project directory:
```bash
git clone https://github.com/YOUR_USERNAME/sre-intern-takehome.git
cd sre-intern-takehome
```

## Running the Code

Terraform commands generally follow a three-step workflow:

### 1. Initialize Terraform
This sets up the working directory and downloads the AWS provider plugin.

```bash
terraform init
```

### 2. Preview the Changes

See what Terraform will create before actually building it.

```bash
terraform plan
```

### 3. Apply the Configuration

Create the resources in AWS.

```bash
terraform apply
```

You will then see Terraform output an IP address, which you can paste into your browser.

##Cleanup

To avoid unecessary AWS charges, run:

```bash
terraform destroy
```

## Conclusion

This project demonstrates the basics of Infrastructure as Code with Terraform.  
It provisions a simple but functional web server on AWS, secured by a security group and automatically configured with Nginx.  
The same approach can be extended to manage more complex infrastructure in a repeatable, reliable way.
