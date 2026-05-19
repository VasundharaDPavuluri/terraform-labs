# Project-09 — Terraform Modules VPC EC2 Infrastructure

This project demonstrates how to build reusable and modular AWS infrastructure using Terraform Modules with:
- Remote Backend (S3)
- DynamoDB State Locking
- Reusable VPC Module
- Reusable Security Group Module
- Reusable EC2 Module

This project introduces enterprise-level Terraform module architecture and infrastructure orchestration concepts.

---

# Project Objective

The objective of this project is to:
- Understand Terraform Modules
- Create reusable infrastructure components
- Build modular AWS infrastructure
- Understand module inputs and outputs
- Implement infrastructure orchestration
- Use remote backend for centralized state management

---

# Real-Time Architecture

```text
Terraform Root Module
        │
        ├── VPC Module
        │      ├── VPC
        │      ├── Public Subnet
        │      ├── Internet Gateway
        │      └── Route Table
        │
        ├── Security Group Module
        │      └── Security Group
        │
        └── EC2 Module
               └── EC2 Instance
```

---

# Remote Backend Architecture

```text
Terraform
    ↓
Remote Backend
 ├── S3 Bucket
 │      └── terraform.tfstate
 │
 └── DynamoDB
        └── State Locking
```

---

# Project Components

| Component | Purpose |
|---|---|
| Root Module | Infrastructure orchestrator |
| VPC Module | Reusable networking infrastructure |
| Security Group Module | Reusable firewall configuration |
| EC2 Module | Reusable EC2 deployment |
| S3 Backend | Remote Terraform state |
| DynamoDB | Terraform state locking |

---

# Technologies & Tools Used

- Terraform
- AWS EC2
- AWS VPC
- AWS S3
- AWS DynamoDB
- AWS CLI
- Git & GitHub
- VS Code

---

# Prerequisites

Before starting this project:

- AWS Account
- IAM User with required permissions
- Terraform installed
- AWS CLI installed
- Git installed
- VS Code installed
- Existing Terraform backend setup

---

# Important Terraform Concepts

---

# Terraform Modules

Terraform Modules are:
```text
reusable infrastructure components
```

Modules help:
- avoid code duplication
- improve scalability
- organize infrastructure
- standardize deployments

---

# Root Module

The Root Module acts like:
```text
main infrastructure orchestrator
```

Responsibilities:
- call child modules
- pass input values
- connect module outputs
- manage infrastructure flow

---

# Child Modules

Child Modules act like:
```text
reusable infrastructure functions
```

Each module:
- receives inputs
- creates resources
- returns outputs

---

# Module Communication

Terraform modules communicate using:
- inputs
- outputs

Modules NEVER directly communicate with each other.

---

# Module Flow

```text
terraform.tfvars
        ↓
Root variables.tf
        ↓
Root main.tf
        ↓
Calls Modules
        ↓
Modules Create Resources
        ↓
Modules Return Outputs
        ↓
Root outputs.tf
```

---

# Infrastructure Dependency Flow

```text
VPC Module
     ↓
returns subnet_id + vpc_id
     ↓
Root main.tf
     ↓
passes values
     ↓
Security Group Module
     ↓
EC2 Module
```

---

# Project Structure

```text
project-09-terraform-modules-vpc-ec2/
│
├── provider.tf
├── backend.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
├── .gitignore
├── README.md
│
├── modules/
│   │
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── security-group/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── ec2/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
```

---

# Module Definitions

---

# VPC Module

Creates:
- VPC
- Public Subnet
- Internet Gateway
- Route Table

Inputs:
- VPC CIDR
- subnet CIDR
- availability zone

Outputs:
- VPC ID
- subnet ID

---

# Security Group Module

Creates:
- Security Group

Inputs:
- VPC ID

Outputs:
- Security Group ID

---

# EC2 Module

Creates:
- EC2 Instance

Inputs:
- AMI ID
- instance type
- subnet ID
- security group ID

Outputs:
- EC2 public IP
- EC2 public DNS

---

# Variables Architecture

---

# Root variables.tf

Defines:
```text
project-level variables
```

Examples:
- region
- CIDR blocks
- AMI
- instance type

---

# Module variables.tf

Defines:
```text
module-specific inputs
```

---

# terraform.tfvars

Stores:
```text
actual runtime values
```

Examples:
- AMI IDs
- subnet ranges
- instance types

---

# Remote Backend

Terraform state is stored remotely in:
```text
AWS S3
```

Benefits:
- centralized state
- team collaboration
- infrastructure consistency

---

# State Locking

Terraform uses:
```text
DynamoDB
```

for:
```text
state locking
```

Purpose:
- prevent simultaneous terraform apply
- avoid infrastructure corruption

---

# Implementation Steps

---

# Step 1 — Create Project Structure

Create:
- root module
- child modules
- backend configuration

---

# Step 2 — Configure Provider

Create:
```text
provider.tf
```

Configure:
- AWS provider
- provider version
- region

---

# Step 3 — Configure Remote Backend

Create:
```text
backend.tf
```

Connect:
- S3 backend
- DynamoDB lock table

---

# Step 4 — Define Root Variables

Create:
```text
variables.tf
```

Define:
- region
- CIDR blocks
- AMI ID
- instance type

---

# Step 5 — Add terraform.tfvars

Create:
```text
terraform.tfvars
```

Provide:
- AMI ID
- runtime values

---

# Step 6 — Create VPC Module

Creates:
- VPC
- subnet
- IGW
- route table

---

# Step 7 — Create Security Group Module

Creates:
- security group

---

# Step 8 — Create EC2 Module

Creates:
- EC2 instance

---

# Step 9 — Configure Root main.tf

Root module:
- calls child modules
- passes variables
- connects outputs to inputs

---

# Step 10 — Configure Outputs

Display:
- VPC ID
- subnet ID
- SG ID
- EC2 public IP
- EC2 public DNS

---

# Terraform Commands Used

---

# Initialize Terraform

```bash
terraform init
```

Purpose:
- initialize backend
- download providers
- initialize modules

---

# Validate Terraform Configuration

```bash
terraform validate
```

Purpose:
```text
validate Terraform syntax
```

---

# Format Terraform Files

```bash
terraform fmt
```

Purpose:
```text
format Terraform files
```

---

# Review Infrastructure Plan

```bash
terraform plan
```

Purpose:
```text
review infrastructure changes before deployment
```

---

# Create Infrastructure

```bash
terraform apply
```

Creates:
- VPC
- subnet
- route table
- SG
- EC2

### AWS Console - VPC, Subnet & route table Created

<img width="1919" height="273" alt="Screenshot 2026-05-18 141326" src="https://github.com/user-attachments/assets/e4c83137-9ba0-4ad0-957e-1d8f567262ad" />

### AWS Console - Security Group created

<img width="1919" height="239" alt="Screenshot 2026-05-18 141339" src="https://github.com/user-attachments/assets/46235960-8011-473f-9ccc-2bf9005d5481" />

### AWS Console - EC2 Instance

<img width="1919" height="231" alt="Screenshot 2026-05-18 141314" src="https://github.com/user-attachments/assets/50845e7a-ad22-499a-b9f2-5496edd21ab1" />

---

# Destroy Infrastructure

```bash
terraform destroy
```

Deletes:
- EC2
- SG
- subnet
- route table
- VPC

---

# View Managed Resources

```bash
terraform state list
```

Displays:
```text
all Terraform-managed resources
```

---

# View Resource Details

```bash
terraform state show <resource_name>
```

Example:

```bash
terraform state show module.ec2.aws_instance.project_ec2
```

---

# Outputs

Terraform displays:
- VPC ID
- subnet ID
- SG ID
- EC2 public IP
- EC2 public DNS

---

# Learning Outcomes

This project helps understand:
- Terraform Modules
- Root vs Child Modules
- Module inputs & outputs
- Infrastructure orchestration
- Reusable infrastructure design
- Remote backend architecture
- State locking
- Enterprise Terraform workflow

---

# Real-Time Enterprise Importance

This project represents:
```text
enterprise Terraform architecture
```

because:
- infrastructure is modular
- components are reusable
- state is centralized
- deployments are scalable

---

# Future Enhancements

Future projects:
- NAT Gateway Module
- ALB Module
- Auto Scaling Module
- RDS Module
- EKS Module
- Jenkins Terraform Pipeline
- Multi-Environment Deployment

---
