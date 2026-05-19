# Project-08 — Remote Backend VPC EC2 Infrastructure

This project demonstrates how to provision AWS infrastructure using Terraform with:
- Remote Backend (S3)
- State Locking (DynamoDB)
- Custom VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance

This project follows a more realistic enterprise Terraform architecture.

---

# Project Objective

The objective of this project is to:
- Use Terraform Remote Backend
- Provision AWS infrastructure using Terraform
- Create custom networking components
- Deploy EC2 instance inside custom VPC
- Understand infrastructure dependency management
- Understand remote state management workflow

---

# Real-Time Architecture

```text
Terraform CLI
      ↓
Remote Backend
   ├── S3 Bucket
   │      └── terraform.tfstate
   │
   └── DynamoDB
          └── State Locking
      ↓
AWS Infrastructure
   ├── VPC
   ├── Public Subnet
   ├── Internet Gateway
   ├── Route Table
   ├── Security Group
   └── EC2 Instance
```

---

# Project Components

| Component | Purpose |
|---|---|
| VPC | Private application network |
| Public Subnet | User-facing infrastructure |
| Internet Gateway | Internet connectivity |
| Route Table | Traffic routing |
| Security Group | Firewall rules |
| EC2 | Virtual server |
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
- AWS CLI installed
- Terraform installed
- Git installed
- VS Code installed
- AWS CLI configured
- Existing Terraform backend setup

---

# Backend Requirement

This project uses:
- existing S3 backend
- existing DynamoDB lock table

Backend infrastructure is created separately using:

```text
project-07-backend-bootstrap-setup
```

---

# Project Structure

```text
project-08-remote-backend-vpc-ec2/
│
├── provider.tf
├── backend.tf
├── variables.tf
├── terraform.tfvars
├── vpc.tf
├── subnet.tf
├── internet-gateway.tf
├── route-table.tf
├── security-group.tf
├── ec2.tf
├── outputs.tf
├── .gitignore
└── README.md
```

---

# Terraform Files Explained

| File | Purpose |
|---|---|
| provider.tf | AWS provider configuration |
| backend.tf | Remote backend configuration |
| variables.tf | Variable definitions |
| terraform.tfvars | Runtime variable values |
| vpc.tf | Creates custom VPC |
| subnet.tf | Creates public subnet |
| internet-gateway.tf | Creates IGW |
| route-table.tf | Creates route table |
| security-group.tf | Creates security group |
| ec2.tf | Launches EC2 instance |
| outputs.tf | Displays Terraform outputs |

---

# Infrastructure Flow

```text
Provider
   ↓
Backend
   ↓
VPC
   ↓
Subnet
   ↓
Internet Gateway
   ↓
Route Table
   ↓
Security Group
   ↓
EC2
```

---

# Important Terraform Concepts

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
- CI/CD integration

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
- ensure consistency

---

# Terraform Variables

Variables improve:
- reusability
- maintainability
- flexibility

---

# terraform.tfvars

Used to provide:
```text
environment-specific values
```

such as:
- AMI IDs
- instance types
- CIDR blocks

---

# Infrastructure Dependency Management

Terraform automatically manages:
- creation order
- deletion order
- resource dependencies

using:
```text
dependency graph
```

---

# Implementation Steps

---

# Step 1 — Create Project Folder

```bash
mkdir project-08-remote-backend-vpc-ec2
cd project-08-remote-backend-vpc-ec2
```

---

# Step 2 — Create Terraform Files

```bash
touch provider.tf backend.tf variables.tf terraform.tfvars \
vpc.tf subnet.tf internet-gateway.tf route-table.tf \
security-group.tf ec2.tf outputs.tf README.md .gitignore
```

---

# Step 3 — Configure AWS Provider

Create:
```text
provider.tf
```

Configure:
- AWS provider
- provider version
- region

---

# Step 4 — Configure Remote Backend

Create:
```text
backend.tf
```

Connect:
- S3 backend
- DynamoDB lock table

---

# Step 5 — Configure Variables

Create:
```text
variables.tf
```

Define:
- region
- CIDR blocks
- instance type
- AMI ID

---

# Step 6 — Configure terraform.tfvars

Create:
```text
terraform.tfvars
```

Provide:
- AMI ID
- variable values

---

# Step 7 — Create Networking Components

Terraform creates:
- VPC
- subnet
- IGW
- route table

---

# Step 8 — Configure Security Group

Allow:
- SSH access
- HTTP access

---

# Step 9 — Launch EC2 Instance

Terraform launches EC2 instance inside:
```text
public subnet
```

---

# Step 10 — Initialize Terraform

```bash
terraform init
```

Purpose:
- initialize backend
- download providers
- connect remote state

---

# Step 11 — Validate Terraform Configuration

```bash
terraform validate
```

Purpose:
```text
validate Terraform syntax
```

---

# Step 12 — Format Terraform Files

```bash
terraform fmt
```

Purpose:
```text
format Terraform files properly
```

---

# Step 13 — Review Infrastructure Plan

```bash
terraform plan
```

Purpose:
```text
review infrastructure changes before deployment
```

---

# Step 14 — Create Infrastructure

```bash
terraform apply
```

Terraform creates:
- VPC
- subnet
- IGW
- route table
- SG
- EC2

using:
```text
remote backend state
```

---

# Step 15 — Verify Infrastructure

Verify:
- EC2 running
- VPC created
- subnet created
- backend state file updated in S3

<img width="1919" height="449" alt="Screenshot 2026-05-17 225519" src="https://github.com/user-attachments/assets/ca0e7053-f3c8-4324-8e60-0867965ce62a" />

<img width="1899" height="723" alt="Screenshot 2026-05-17 225612" src="https://github.com/user-attachments/assets/8ad612ca-5da5-4343-8660-3b2c52c3e065" />

### VPC & Components
<img width="1919" height="703" alt="Screenshot 2026-05-17 224908" src="https://github.com/user-attachments/assets/bfc383f0-09ab-42c3-b87c-ee4c6e45be45" />

### Security-Group
<img width="1919" height="670" alt="Screenshot 2026-05-17 224941" src="https://github.com/user-attachments/assets/a3190e06-7628-42e3-b53d-fa2419f479ec" />

### EC2 Instance
<img width="1919" height="312" alt="Screenshot 2026-05-17 224859" src="https://github.com/user-attachments/assets/daca7346-6c8d-4445-ace2-b9b46019dc81" />

---

# Terraform State Commands

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

# View Specific Resource Details

```bash
terraform state show <resource_name>
```

Example:

```bash
terraform state show aws_instance.project_ec2
```

---

# Terraform Destroy Commands

---

# Destroy Complete Infrastructure

```bash
terraform destroy
```

Deletes:
- EC2
- SG
- Route Table
- IGW
- Subnet
- VPC

---

# Destroy Specific Resource

Example:

```bash
terraform destroy -target=aws_instance.project_ec2
```

Deletes only:
```text
EC2 instance
```

---

# Verify Remote Backend

---

# Verify S3 State File

Go to:

```text
AWS → S3 → Bucket
```

Verify:
```text
terraform.tfstate
```

exists.

---

# Verify DynamoDB Locking

Go to:

```text
AWS → DynamoDB → Explore Table Items
```

Verify:
```text
LockID
```

entries during Terraform execution.

---

# Outputs

Terraform displays:
- VPC ID
- subnet ID
- security group ID
- EC2 public IP
- EC2 public DNS

---

# Troubleshooting

---

## Issue — BucketAlreadyExists

### Cause

S3 bucket names must be globally unique.

### Fix

Use unique bucket name.

---

## Issue — Terraform Backend Error

### Cause

Backend infrastructure does not exist.

### Fix

Create backend infrastructure first using:
```text
project-07-backend-bootstrap-setup
```

---

## Issue — State Lock Error

### Error

```text
Error acquiring the state lock
```

### Cause

Another Terraform execution running.

### Fix

Wait until lock released.

---

## Issue — EC2 SSH Connection Timeout

### Check

- Security Group
- Route Table
- Internet Gateway
- Public IP
- Key Pair

---

# Git Best Practices

## Push These Files

- `.tf files`
- `.terraform.lock.hcl`
- `README.md`
- `.gitignore`

## Ignore These Files

```gitignore
.terraform/
*.tfstate
*.tfstate.backup
```

---

# Learning Outcomes

This project helps understand:
- Remote Terraform backend
- State locking
- Infrastructure orchestration
- Terraform dependency graph
- AWS networking
- Terraform variables
- Enterprise Terraform workflow

---

# Real-Time Enterprise Importance

This project represents:
```text
real infrastructure provisioning workflow
```

using:
- centralized state
- backend architecture
- infrastructure dependency management

---

# Future Enhancements

Future projects:
- Terraform Modules
- NAT Gateway
- Private Subnets
- ALB & Auto Scaling
- RDS Integration
- Jenkins Terraform Pipelines
- EKS Infrastructure

---
