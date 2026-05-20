# Project-03 — AWS VPC, EC2 & Security Group using Terraform

This project demonstrates how to provision AWS networking and compute infrastructure using Terraform.

The project creates:
- Custom VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance

This is one of the foundational Terraform projects for understanding Infrastructure as Code (IaC) and AWS infrastructure automation.

---

# Project Objective

The objective of this project is to:
- Understand Infrastructure as Code (IaC)
- Learn Terraform basics
- Create AWS networking infrastructure
- Launch EC2 inside custom VPC
- Configure Security Groups
- Understand Terraform dependency flow
- Automate infrastructure deployment

---

# Real-Time Problem Statement

Manually creating infrastructure in AWS Console:
- takes time
- creates inconsistencies
- increases operational errors
- becomes difficult to scale

Example:
Creating:
- VPC
- subnet
- internet gateway
- route tables
- security groups
- EC2 instances

manually for every environment becomes repetitive and inefficient.

---

# Solution

Terraform allows infrastructure creation using:
```text
declarative configuration files
```

Infrastructure becomes:
- reusable
- version controlled
- automated
- scalable
- consistent

---

# Project Architecture

```text
Terraform
    │
    ├── VPC
    │
    ├── Public Subnet
    │
    ├── Internet Gateway
    │
    ├── Route Table
    │
    ├── Security Group
    │
    └── EC2 Instance
```

---

# Infrastructure Flow

```text
Terraform Apply
      ↓
Create VPC
      ↓
Create Public Subnet
      ↓
Attach Internet Gateway
      ↓
Create Route Table
      ↓
Associate Route Table
      ↓
Create Security Group
      ↓
Launch EC2 Instance
```

---

# Technologies Used

- Terraform
- AWS EC2
- AWS VPC
- AWS Security Groups
- AWS Route Tables
- AWS Internet Gateway
- AWS CLI
- Git & GitHub
- VS Code

---

# Prerequisites

Before starting this project:

- AWS Account
- Terraform Installed
- AWS CLI Installed
- AWS CLI Configured
- IAM User with AWS Permissions
- VS Code Installed

---

# Project Structure

```text
project-03-vpc-ec2-sg/
│
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
├── .gitignore
└── README.md
```

---

# Infrastructure Components

---

# 1. VPC

Creates:
```text
isolated private AWS network
```

Example:

```hcl
resource "aws_vpc" "main_vpc"
```

Purpose:
- logically isolate infrastructure
- control networking
- manage subnets and routing

---

# 2. Public Subnet

Creates:
```text
publicly accessible subnet
```

inside the VPC.

Features:
- auto-assign public IP
- internet connectivity

---

# 3. Internet Gateway

Allows:
```text
internet access
```

for resources inside VPC.

Without Internet Gateway:
```text
EC2 cannot access internet
```

---

# 4. Route Table

Defines:
```text
network traffic routing
```

Example:

```text
0.0.0.0/0 → Internet Gateway
```

This enables outbound internet connectivity.

---

# 5. Route Table Association

Associates:
```text
subnet ↔ route table
```

This tells AWS:
```text
which routing rules apply to subnet
```

---

# 6. Security Group

Acts as:
```text
virtual firewall
```

Controls:
- inbound traffic
- outbound traffic

---

# 7. EC2 Instance

Creates:
```text
virtual machine
```

inside AWS.

EC2 is deployed inside:
- custom VPC
- public subnet
- attached security group

---

# Security Group Rules

This project allows:

| Port | Purpose |
|---|---|
| 22 | SSH Access |
| 80 | HTTP Access |

---

# Terraform Files Explanation

---

# provider.tf

Configures:
- AWS provider
- AWS region

Example:

```hcl
provider "aws" {
  region = "ap-south-1"
}
```

---

# variables.tf

Defines:
- reusable Terraform variables

Example:
- VPC CIDR
- subnet CIDR
- instance type
- AMI ID

---

# terraform.tfvars

Stores:
```text
actual variable values
```

Example:

```hcl
aws_region = "ap-south-1"
instance_type = "t2.micro"
```

---

# main.tf

Contains:
- AWS infrastructure resources

Example:
- VPC
- subnet
- EC2
- security group

---

# outputs.tf

Displays:
- EC2 Public IP
- VPC ID
- subnet ID
- Security Group ID

after deployment.

---

# Terraform Workflow

---

# Step-1 — Initialize Terraform

```bash
terraform init
```

Downloads:
- Terraform providers
- required plugins

---

# Step-2 — Validate Terraform Configuration

```bash
terraform validate
```

Checks:
- syntax
- Terraform configuration validity

---

# Step-3 — Format Terraform Files

```bash
terraform fmt
```

Formats Terraform code properly.

---

# Step-4 — Preview Infrastructure

```bash
terraform plan
```

Shows:
```text
what Terraform will create
```

before deployment.

---

# Step-5 — Deploy Infrastructure

```bash
terraform apply
```

Creates AWS resources.

Terraform asks for confirmation:
```text
Enter a value: yes
```

---

# Step-6 — Destroy Infrastructure

```bash
terraform destroy
```

Deletes all created infrastructure.

---

# Outputs

Terraform displays:

- EC2 Public IP
- VPC ID
- subnet ID
- Security Group ID

Example:

```text
ec2_public_ip = "13.x.x.x"
vpc_id = "vpc-xxxxxxxx"
```

---

# Verification

After deployment:
- Verify VPC in AWS Console
- Verify subnet creation
- Verify EC2 instance running
- Verify security group rules

---

# SSH Into EC2

Example:

```bash
ssh -i key.pem ec2-user@<PUBLIC-IP>
```

---
# Terraform Console Output

Add screenshots showing:
- terraform init
- terraform plan
- terraform apply

---

# EC2 Verification

Add screenshots showing:
- EC2 running state
- SSH connection

---

# Important Learning Outcomes

This project helps understand:
- Terraform Basics
- Infrastructure as Code
- AWS Networking
- EC2 Provisioning
- Security Groups
- Terraform Resource Dependencies
- Infrastructure Automation

---

# Terraform Resource Dependency Understanding

Terraform automatically understands:
```text
resource relationships
```

Example:

```text
EC2 depends on subnet
Subnet depends on VPC
Route depends on Internet Gateway
```

Terraform creates resources in correct order automatically.

---

# Real-Time Enterprise Relevance

This project demonstrates:
```text
foundational cloud infrastructure provisioning
```

used in real DevOps and Cloud Engineering environments.

---

# Important Best Practices

Terraform repositories should:
- use `.gitignore`
- avoid committing `.terraform`
- avoid committing `.tfstate`
- avoid committing secrets

---

# Recommended .gitignore

```gitignore
# Terraform
.terraform/
*.tfstate
*.tfstate.*
crash.log

# Sensitive Files
*.pem
*.tfvars

# Terraform Lock File
.terraform.lock.hcl
```

---

# Common Beginner Mistakes

---

# 1. Committing `.terraform` Folder

Problem:
- huge provider binaries
- GitHub push failures

Solution:
```text
use .gitignore
```

---

# 2. Committing `.tfstate`

Problem:
- sensitive infrastructure information exposed

Solution:
```text
never push state files
```

---

# 3. Wrong Security Group Rules

Problem:
- SSH inaccessible

Solution:
```text
allow port 22
```

---

# 4. Missing Internet Gateway

Problem:
```text
EC2 cannot access internet
```

---

# Future Enhancements

Next improvements may include:
- Remote Backend
- Terraform Modules
- Workspaces
- Provisioners
- Load Balancer
- Auto Scaling
- RDS
- Kubernetes Infrastructure

---
