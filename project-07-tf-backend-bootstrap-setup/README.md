# Project-07 — Backend Bootstrap Setup

This project demonstrates how to create a permanent Terraform Remote Backend infrastructure using:
- AWS S3 Bucket for Terraform state storage
- AWS DynamoDB for Terraform state locking

This project acts as the foundational backend layer for all future Terraform infrastructure projects.

---

# Project Objective

The objective of this project is to:
- Create centralized Terraform backend infrastructure
- Store Terraform state remotely in AWS S3
- Configure Terraform state locking using DynamoDB
- Understand backend bootstrap architecture
- Prepare reusable backend infrastructure for future Terraform projects

---

# Why Backend Bootstrap Is Needed

Terraform Remote Backend resources:
- S3 bucket
- DynamoDB table

must exist BEFORE Terraform can use remote backend.

This creates a special setup process called:

```text
Backend Bootstrap
```

---

# Real-Time Problem

Terraform cannot use:
```text
backend.tf
```

before:
- S3 bucket exists
- DynamoDB table exists

Therefore backend infrastructure must be created first using local Terraform state.

---

# Solution Architecture

```text
Terraform
   ↓
AWS Provider
   ↓
Backend Infrastructure
   ├── S3 Bucket
   │      └── Remote Terraform State
   │
   └── DynamoDB Table
          └── State Locking
```

---

# Real-Time Terraform Architecture

```text
Backend Layer
      ↓
Infrastructure Layer
      ↓
Application Layer
```

This project creates:
```text
Backend Layer
```

Future projects use this backend.

---

# Technologies & Tools Used

- Terraform
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

---

# AWS CLI Configuration

Verify AWS authentication:

```bash
aws sts get-caller-identity
```

If not configured:

```bash
aws configure
```

Provide:
- AWS Access Key
- AWS Secret Key
- AWS Region
- Output format

---

# Project Structure

```text
project-07-backend-bootstrap-setup/
│
├── provider.tf
├── s3.tf
├── dynamodb.tf
├── outputs.tf
├── .gitignore
└── README.md
```

---

# Terraform Files Explained

| File | Purpose |
|---|---|
| provider.tf | AWS provider configuration |
| s3.tf | Creates S3 backend bucket |
| dynamodb.tf | Creates DynamoDB lock table |
| outputs.tf | Displays outputs |
| .gitignore | Ignore local Terraform files |

---

# Important Terraform Concepts

---

# Terraform State

Terraform state file stores:
- infrastructure metadata
- resource mapping
- infrastructure dependency information

Terraform uses state file to track:
```text
existing infrastructure
```

---

# Remote Backend

Remote backend stores:
```text
terraform.tfstate
```

inside:
```text
AWS S3
```

instead of local machine.

Benefits:
- centralized state
- team collaboration
- infrastructure consistency
- safer automation

---

# State Locking

Terraform uses DynamoDB for:
```text
state locking
```

Purpose:
- prevent simultaneous terraform apply
- avoid infrastructure corruption
- ensure infrastructure consistency

---

# Backend Bootstrap Process

This project is a:
```text
bootstrap setup project
```

because backend infrastructure must exist BEFORE remote backend can be used.

---

# Bootstrap Workflow

```text
Step-1
Terraform uses local state
      ↓
Step-2
Creates S3 bucket
      ↓
Creates DynamoDB table
      ↓
Step-3
Future Terraform projects use this backend
```

---

# Important Architectural Understanding

This project:
```text
creates backend infrastructure
```

Future projects:
```text
use backend infrastructure
```

This separation is standard enterprise Terraform architecture.

---

# Implementation Steps

---

# Step 1 — Create Project Folder

```bash
mkdir project-07-backend-bootstrap-setup
cd project-07-backend-bootstrap-setup
```

---

# Step 2 — Create Terraform Files

```bash
touch provider.tf s3.tf dynamodb.tf outputs.tf README.md .gitignore
```

---

# Step 3 — Configure AWS Provider

Create:
```text
provider.tf
```

Configure:
- AWS provider
- Terraform provider version
- AWS region

---

# Step 4 — Create S3 Backend Bucket

Create:
```text
s3.tf
```

Purpose:
```text
Store Terraform remote state
```

---

# Step 5 — Create DynamoDB Lock Table

Create:
```text
dynamodb.tf
```

Purpose:
```text
Terraform state locking
```

---

# Step 6 — Add Outputs

Create:
```text
outputs.tf
```

Display:
- S3 bucket name
- DynamoDB table name

---

# Step 7 — Initialize Terraform

```bash
terraform init
```

Downloads required Terraform providers.

---

# Step 8 — Validate Terraform Configuration

```bash
terraform validate
```

Validates Terraform syntax.

---

# Step 9 — Review Infrastructure Plan

```bash
terraform plan
```

Displays infrastructure changes before deployment.

---

# Step 10 — Create Backend Infrastructure

```bash
terraform apply
```

Terraform creates:
- S3 bucket
- DynamoDB table

using:
```text
local Terraform state
```

---

# Verification Steps

---

# Verify S3 Bucket

Go to:

```text
AWS → S3
```

Verify backend bucket exists.

### Screenshot: backend bucket created

<img width="1919" height="538" alt="s3-bucket-tf-backend" src="https://github.com/user-attachments/assets/4902e9d5-0788-43a9-b7a2-665465b16298" />

---

# Verify DynamoDB Table

Go to:

```text
AWS → DynamoDB
```

Verify lock table exists.

### Screenshot: lock table created

<img width="1919" height="308" alt="tf-backend-dynamodb-table" src="https://github.com/user-attachments/assets/167bea84-5915-474f-bd3a-1cd7dc90c21b" />

---

# Future Usage

Future Terraform projects will use: 
```bash
backend.tf
```
```hcl
terraform {
  backend "s3" {
    bucket         = "your-backend-bucket"
    key            = "project-name/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
```

to connect remote backend.

---

# Terraform Workflow Commands

| Command | Purpose |
|---|---|
| terraform init | Initialize Terraform |
| terraform validate | Validate Terraform syntax |
| terraform fmt | Format Terraform files |
| terraform plan | Review infrastructure changes |
| terraform apply | Create infrastructure |
| terraform destroy | Delete infrastructure |

---

# Outputs

Terraform displays:
- S3 bucket name
- DynamoDB table name

Useful for:
- backend configuration
- infrastructure verification

---

# Troubleshooting

---

## Issue — BucketAlreadyExists

### Cause

S3 bucket names must be globally unique.

### Fix

Use unique bucket name.

Example:

```text
vasundhara-tf-backend-2026
```

---

## Issue — AWS Authentication Error

### Fix

Run:

```bash
aws configure
```

---

## Issue — Terraform Provider Error

### Fix

Run:

```bash
terraform init
```

again.

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
- Terraform backend architecture
- S3 remote state storage
- DynamoDB state locking
- Backend bootstrap process
- Enterprise Terraform workflow
- Infrastructure layering concepts

---

# Real-Time Enterprise Importance

This project represents:
```text
shared backend infrastructure
```

used by:
- multiple Terraform projects
- CI/CD pipelines
- Jenkins automation
- team-based infrastructure deployments

---

# Future Projects Using This Backend

- VPC Infrastructure
- EC2 Infrastructure
- RDS Infrastructure
- ALB & Auto Scaling
- EKS Infrastructure
- Jenkins Terraform Pipelines

---

# Author

Vasundhara
