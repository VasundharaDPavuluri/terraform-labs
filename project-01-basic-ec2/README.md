# Terraform EC2 Provisioning on AWS

This project demonstrates how to provision an AWS EC2 instance using Terraform and AWS CLI from a local machine.

The hands-on covers:
- Terraform installation
- AWS CLI configuration
- IAM authentication
- EC2 provisioning using Terraform
- Key Pair integration
- Terraform workflow commands
- Infrastructure as Code (IaC) basics

---

# Architecture Flow

```text
Laptop
  ↓
Terraform + AWS CLI
  ↓
AWS Authentication
  ↓
Terraform Commands
  ↓
AWS Infrastructure Created
```

---

# Technologies Used

- Terraform
- AWS CLI
- Amazon EC2
- Git & GitHub
- Amazon Linux 2023

---

# Project Structure

```text
terraform-basic-handson/
│
├── provider.tf
├── ec2.tf
├── .gitignore
└── README.md
```

---

# Terraform Files

## provider.tf

Defines:
- AWS provider
- Terraform provider configuration
- AWS region

## ec2.tf

Defines:
- EC2 instance resource
- Instance type
- AMI
- Key Pair
- Tags

---

# Prerequisites

Before running this project:

- AWS Account
- IAM User with required permissions
- AWS CLI installed
- Terraform installed
- Git installed
- VS Code / Terminal

---

# Correct Workflow

## Step 1 — Create Terraform Files

Created files:
- provider.tf
- ec2.tf
- README.md

---

## Step 2 — Create IAM User in AWS

Terraform requires AWS credentials for authentication.

Navigate to:

```text
AWS Console
→ IAM
→ Users
→ Create User
```

Example user:

```text
terraform-user
```

Attach policy:

```text
AdministratorAccess
```

> Note: This is used only for learning purposes.

---

## Step 3 — Create Access Key

Inside IAM User:

```text
Security Credentials
→ Create Access Key
→ CLI
```

You will receive:
- AWS Access Key
- AWS Secret Access Key

Store them securely.

---

# AWS CLI Configuration

Configure AWS credentials:

```bash
aws configure
```

Provide:

- AWS Access Key
- AWS Secret Access Key
- Region → ap-south-1
- Output Format → json

---

# Verify Authentication

Run:

```bash
aws sts get-caller-identity
```

If successful, Terraform can authenticate with AWS.

---

# Terraform Workflow

## Initialize Terraform

```bash
terraform init
```

Downloads required Terraform provider plugins.

---

## Format Terraform Code

```bash
terraform fmt
```

Formats Terraform files.

---

## Validate Terraform Code

```bash
terraform validate
```

Validates Terraform syntax.

---

## Review Execution Plan

```bash
terraform plan
```

Displays infrastructure changes before deployment.

---

## Provision Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

Terraform creates AWS infrastructure.

---

# Result

Terraform provisions:

- AWS EC2 Instance
- Attached Key Pair
- Security Group (optional enhancement)

without manually creating EC2 from AWS Console.

This demonstrates Infrastructure as Code (IaC).

---

# Adding Key Pair

## Create Key Pair in AWS Console

Navigate to:

```text
EC2
→ Key Pairs
→ Create Key Pair
```

Example:

```text
terraform-key
```

Settings:
- RSA
- .pem format

Download and store the key securely.

---

# Modify ec2.tf

```hcl
resource "aws_instance" "terraform_ec2" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"
  key_name      = "terraform-key"

  tags = {
    Name = "Terraform-EC2"
  }
}
```

---

# Apply Infrastructure Changes

Run:

```bash
terraform plan
```

Terraform detects infrastructure changes.

You may observe:

```text
-/+ resource will be replaced
```

This means Terraform will:
- destroy existing EC2
- recreate EC2 with updated configuration

This behavior is called:

```text
Resource Replacement
```

---

# Why EC2 Gets Recreated

Some EC2 properties cannot be modified in-place.

Examples:
- Key Pair
- AMI
- Certain networking attributes

Terraform handles this by:
1. Destroying old resource
2. Creating new resource

---

# Apply Updated Configuration

Run:

```bash
terraform apply
```

Type:

```text
yes
```

Terraform creates a new EC2 instance with attached SSH key.

---

# Verify in AWS Console

Navigate to:

```text
EC2
→ Instances
```

Verify:

```text
Key Pair Name
→ terraform-key
```

Now SSH access is possible.

---

# Cleanup

To avoid unnecessary AWS billing:

```bash
terraform destroy
```

This removes all Terraform-managed infrastructure.

---

# Learning Outcomes

This project helps understand:

- Infrastructure as Code (IaC)
- Terraform basics
- AWS authentication
- Terraform provider configuration
- EC2 provisioning
- Terraform lifecycle commands
- Resource replacement behavior
- Key Pair integration
- Infrastructure automation using Terraform

---
