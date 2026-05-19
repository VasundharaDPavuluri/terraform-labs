# Terraform Labs

This repository contains beginner-to-intermediate Terraform hands-on projects focused on AWS Infrastructure as Code (IaC).

The labs cover:
- Terraform basics
- AWS provider configuration
- EC2 provisioning
- VPC networking
- Public and Private Subnets
- Security Groups
- Route Tables
- Internet Gateway
- Terraform Variables
- Infrastructure automation concepts

---

# Repository Purpose

This repository is created for learning and practicing:
- Terraform fundamentals
- AWS infrastructure provisioning
- Networking concepts
- Real-time infrastructure flow
- Infrastructure modular thinking

---

# Technologies Used

- Terraform
- AWS CLI
- Amazon EC2
- AWS VPC
- Git & GitHub
- VS Code

---

# Repository Structure

```text
terraform-labs/
│
├── terraform-basic-handson/
├── terraform-vpc-handson/
├── terraform-vpc-ec2-project/
├── terraform_var_project/
└── README.md
```

---

# Projects Overview

---

# Project-1 — Terraform Basic Hands-On

## Topics Covered

- Terraform installation
- AWS CLI configuration
- IAM User setup
- EC2 provisioning
- Key Pair integration
- Security Group basics
- Terraform lifecycle commands

## Key Learnings

- Infrastructure as Code (IaC)
- Terraform workflow
- AWS authentication
- EC2 provisioning

---

# Project-2 — Terraform VPC Hands-On

## Topics Covered

- VPC creation
- Public and Private Subnets
- Internet Gateway
- Route Tables
- Route Table Associations

## Key Learnings

- AWS networking basics
- Public vs Private Subnets
- Internet routing
- VPC communication flow

---

# Project-3 — Terraform VPC EC2 Project

## Topics Covered

- Custom VPC
- Public Subnet
- Security Groups
- EC2 inside custom VPC
- Infrastructure dependency mapping

## Project Structure

```text
terraform-vpc-ec2-project/
├── provider.tf
├── vpc.tf
├── subnet.tf
├── security-group.tf
├── ec2-instance.tf
├── outputs.tf
└── README.md
```

## Key Learnings

- VPC + EC2 integration
- Security Group configuration
- Public subnet deployment
- Terraform resource dependencies

---

# Project-4 — Terraform Variables Project

## Topics Covered

- Terraform Variables
- Dynamic infrastructure configuration
- terraform.tfvars
- Reusable Terraform code
- Parameterized AWS resources

## Project Structure

```text
terraform_var_project/
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── vpc.tf
├── subnet.tf
├── security-group.tf
├── ec2-instance.tf
├── outputs.tf
└── README.md
```

## Key Learnings

- Input Variables
- Dynamic Terraform values
- Infrastructure reusability
- Environment-based configuration
- Terraform variable references

---

# Terraform Workflow

## Initialize Terraform

```bash
terraform init
```

Downloads required provider plugins.

---

## Format Terraform Code

```bash
terraform fmt
```

Formats Terraform files.

---

## Validate Terraform Configuration

```bash
terraform validate
```

Validates Terraform syntax.

---

## Review Infrastructure Changes

```bash
terraform plan
```

Displays infrastructure changes before deployment.

---

## Provision Infrastructure

```bash
terraform apply
```

Creates AWS infrastructure.

---

## Destroy Infrastructure

```bash
terraform destroy
```

Deletes Terraform-managed resources.

---

# Real-Time AWS Architecture Flow

```text
Users
  ↓
Internet
  ↓
Internet Gateway
  ↓
Public Route Table
  ↓
Public Subnet
  ↓
Frontend / EC2
  ↓
Private VPC Communication
  ↓
Private Subnet
  ↓
Backend / Database
```

---

# Key AWS Networking Concepts

| Component | Purpose |
|---|---|
| VPC | Application network |
| Public Subnet | User-facing resources |
| Private Subnet | Internal secure resources |
| Internet Gateway | Internet access |
| Route Table | Traffic routing |
| Security Group | Instance firewall |
| NAT Gateway | Outbound internet for private subnet |

---

# Variables in Terraform

Variables are used to make Terraform code:
- reusable
- dynamic
- configurable

Example:

```hcl
instance_type = var.instance_type
```

instead of:

```hcl
instance_type = "t2.micro"
```

---

# Important Terraform Files

| File | Purpose |
|---|---|
| provider.tf | Provider configuration |
| variables.tf | Define input variables |
| terraform.tfvars | Variable values |
| outputs.tf | Display outputs |
| .terraform.lock.hcl | Provider version lock file |

---

# Git Best Practices Used

## Tracked Files

- `.tf` files
- `README.md`
- `.terraform.lock.hcl`
- `.gitignore`

## Ignored Files

```gitignore
.terraform/
*.tfstate
*.tfstate.backup
```

---

# Learning Outcomes

This repository helps understand:
- Terraform fundamentals
- AWS networking
- EC2 provisioning
- Security Groups
- VPC architecture
- Terraform Variables
- Infrastructure automation
- Resource dependencies
- Infrastructure as Code (IaC)

---

# Future Enhancements

Planned advanced topics:
- Terraform Modules
- Remote Backend (S3 + DynamoDB)
- NAT Gateway
- Application Load Balancer (ALB)
- Auto Scaling
- RDS Integration
- Jenkins CI/CD
- EKS Terraform deployment

---
