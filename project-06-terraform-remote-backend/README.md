# Project-06 — Terraform Remote Backend

This project demonstrates how to configure a Remote Backend in Terraform using:
- AWS S3 Bucket for remote state storage
- AWS DynamoDB for state locking

The project introduces enterprise-level Terraform state management concepts.

---

# Project Objective

The objective of this project is to:
- Understand Terraform state management
- Configure Terraform Remote Backend
- Store Terraform state remotely in AWS S3
- Implement Terraform state locking using DynamoDB
- Learn backend initialization and state migration process
- Understand real-time collaborative Terraform workflow

---

# Why Remote Backend Is Important

By default, Terraform stores infrastructure state locally:

```text
terraform.tfstate
```

Problems with local state:
- No centralized storage
- Risk of accidental deletion
- Difficult team collaboration
- No infrastructure locking
- Unsafe concurrent Terraform execution

Remote backend solves these problems.

---

# Solution Architecture

Terraform Remote Backend uses:

| Service | Purpose |
|---|---|
| AWS S3 | Store Terraform state remotely |
| DynamoDB | State locking |

---

# Real-Time Architecture Flow

```text
Terraform CLI
      ↓
AWS Provider
      ↓
S3 Bucket
      ↓
backend.tfstate

DynamoDB Table
      ↓
State Locking
```

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
project-06-terraform-remote-backend/
│
├── provider.tf
├── s3.tf
├── dynamodb.tf
├── backend.tf
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
| backend.tf | Configures Terraform backend |
| outputs.tf | Displays outputs |
| .gitignore | Ignore local Terraform files |

---

# Important Terraform Concepts

---

# Terraform State

Terraform state file stores:
- infrastructure metadata
- AWS resource mapping
- dependency information
- current infrastructure status

Terraform uses this file to understand:
```text
what infrastructure already exists
```

---

# State Locking

State locking prevents:
```text
multiple terraform apply executions simultaneously
```

Terraform uses DynamoDB to:
- create temporary locks
- prevent infrastructure conflicts
- ensure infrastructure consistency

---

# Backend Bootstrap Process

This is the MOST important concept in this project.

Terraform backend resources must exist BEFORE Terraform can use remote backend.

---

# Phase-1 — Create Backend Infrastructure

Initially Terraform uses:
```text
local state
```

Terraform creates:
- S3 bucket
- DynamoDB table

using local Terraform state.

Files used:
- provider.tf
- s3.tf
- dynamodb.tf
- outputs.tf

---

# Phase-2 — Configure Backend

After backend resources exist:
- backend.tf is configured
- Terraform backend initialized

Terraform migrates:
```text
local tfstate → remote S3 backend
```

---

# Phase-3 — Remote Backend Active

After migration:
- Terraform reads state from S3
- Terraform uses DynamoDB locking
- Local state no longer primary source

---

# Implementation Steps

---

# Step 1 — Create Project Folder

```bash
mkdir project-06-terraform-remote-backend
cd project-06-terraform-remote-backend
```

---

# Step 2 — Create Terraform Files

```bash
touch provider.tf s3.tf dynamodb.tf backend.tf outputs.tf README.md .gitignore
```

---

# Step 3 — Configure AWS Provider

Create:
```text
provider.tf
```

Configure:
- AWS provider
- region
- Terraform provider version

---

# Step 4 — Create S3 Bucket

Create:
```text
s3.tf
```

Purpose:
```text
Store Terraform remote state
```

---

# Step 5 — Create DynamoDB Table

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

# Step 10 — Provision Backend Infrastructure

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
### S3 bucket created
<img width="1919" height="535" alt="s3-bucket" src="https://github.com/user-attachments/assets/198a5f32-87f6-41af-958b-aa422d113f5f" />


### Dynamodb Table created
<img width="1919" height="300" alt="dynamodb-table" src="https://github.com/user-attachments/assets/edb26556-1481-4ea5-813a-901c26a8465b" />

---

# Step 11 — Configure Remote Backend

Create:
```text
backend.tf
```

Example:

```hcl
terraform {
  backend "s3" {
    bucket         = "your-s3-bucket-name"
    key            = "terraform/backend.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
```

---

# Step 12 — Initialize Backend Migration

Run:

```bash
terraform init
```

Terraform asks:

```text
Do you want to migrate existing state?
```

Type:

```text
yes
```

Terraform migrates:
```text
local state → S3 backend
```

### Screenshot: Backend Migration Initialization
<img width="1297" height="516" alt="terraform-apply-backend-create" src="https://github.com/user-attachments/assets/7f2f0179-21b9-4e93-8f60-57a223f88d21" />

---

# Step 13 — Verify Backend

---

## Verify S3 Backend

Go to:

```text
AWS → S3 → Bucket
```

Verify:
```text
backend.tfstate
```

exists.

### Screenshot: AWS Console

<img width="1919" height="502" alt="key-in-s3" src="https://github.com/user-attachments/assets/76923ab6-b334-422a-b5ee-9a66fa33bb4b" />


---

## Verify DynamoDB Locking

Go to:

```text
AWS → DynamoDB → Explore Items
```

Verify:
```text
LockID
```

entry exists.

### Screenshot: AWS Console
<img width="1893" height="710" alt="key-in-dynamodb" src="https://github.com/user-attachments/assets/53278a49-ff26-4a87-b0c8-1baccddbd3a7" />

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

Useful for backend verification.

### Screenshot for reference:
<img width="909" height="298" alt="terraform-apply-tfstate" src="https://github.com/user-attachments/assets/f77efe2f-ea61-4fa0-a5fc-874233d9b4c9" />

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
vasundhara-tf-state-2026
```

---

## Issue — Backend Initialization Failed

### Cause

Backend resources do not exist.

### Fix

Create:
- S3 bucket
- DynamoDB table

before enabling backend.

---

## Issue — State Lock Error

### Error

```text
Error acquiring the state lock
```

### Cause

Another Terraform execution already running.

### Fix

Wait until lock released.

---

## Issue — AWS Authentication Error

### Fix

Run:

```bash
aws configure
```

---

# Learning Outcomes

This project helps understand:
- Terraform state management
- Local vs remote state
- S3 backend configuration
- DynamoDB state locking
- Backend initialization flow
- State migration process
- Enterprise Terraform workflow

---

# Real-Time Enterprise Importance

This is a foundational enterprise Terraform concept because:
- infrastructure is shared
- multiple engineers collaborate
- CI/CD systems use same infrastructure state
- centralized state management is mandatory

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

# Cleanup (for POCs)

To delete backend resources:

```bash
terraform destroy
```

---

# Future Enhancements

Future projects:
- Terraform Modules
- NAT Gateway
- ALB + Auto Scaling
- RDS Integration
- Jenkins + Terraform
- EKS Infrastructure

---

# Author

Vasundhara
