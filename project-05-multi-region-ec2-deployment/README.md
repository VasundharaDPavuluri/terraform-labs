# Project-05 — Multi-Region EC2 Deployment

This project demonstrates how to provision an AWS EC2 instance in a different AWS region using Terraform.

The project focuses on:
- Region-based infrastructure deployment
- AWS provider configuration
- Default VPC usage
- EC2 provisioning using Terraform
- Region-specific AMI handling

---

# Project Objective

The objective of this project is to:
- Understand multi-region AWS deployments
- Learn region-based Terraform provisioning
- Deploy EC2 instance in Oregon region
- Understand default VPC behavior
- Learn region-specific AMI concepts

---

# AWS Region Used

| Region Name | Region Code |
|---|---|
| Oregon | us-west-2 |

---

# Technologies & Tools Used

- Terraform
- AWS EC2
- AWS CLI
- Git & GitHub
- VS Code
- Amazon Linux / Ubuntu AMI

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
- Region
- Output format

---

# Project Structure

```text
project-05-multi-region-ec2-deployment/
│
├── provider.tf
├── ec2.tf
├── outputs.tf
├── .gitignore
└── README.md
```

---

# Architecture Overview

```text
Terraform
   ↓
AWS Provider
   ↓
Oregon Region (us-west-2)
   ↓
Default VPC
   ↓
EC2 Instance
```

---

# Important Concepts

## Default VPC

AWS automatically creates:
- default VPC
- default subnet
- route tables
- internet gateway

Terraform uses these existing resources automatically if subnet/VPC is not specified.

---

# Region-Specific AMI

AMI IDs are region-specific.

Example:

```text
AMI in Mumbai ≠ AMI in Oregon
```

Always copy AMI from the target region.

---

# Implementation Steps

---

# Step 1 — Create Project Directory

```bash
mkdir project-05-multi-region-ec2-deployment
cd project-05-multi-region-ec2-deployment
```

Create files:

```bash
touch provider.tf ec2.tf outputs.tf README.md .gitignore
```

---

# Step 2 — Configure AWS Provider

Create:

```text
provider.tf
```

Purpose:
- Configure AWS provider
- Define target region
- Authenticate Terraform with AWS

Target region:
```text
us-west-2
```

---

# Step 3 — Create EC2 Resource

Create:

```text
ec2.tf
```

Define:
- EC2 instance
- AMI ID
- Instance type
- Tags

Important:
- Use AMI from Oregon region
- Instance launches in default VPC/subnet

---

# Step 4 — Add Outputs

Create:

```text
outputs.tf
```

Display:
- EC2 Instance ID
- Public IP
- Public DNS

---

# Step 5 — Initialize Terraform

```bash
terraform init
```

Downloads required Terraform provider plugins.

---

# Step 6 — Validate Terraform Code

```bash
terraform validate
```

Validates Terraform syntax.

---

# Step 7 — Review Execution Plan

```bash
terraform plan
```

Displays infrastructure changes before deployment.

---

# Step 8 — Provision Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

Terraform provisions EC2 instance in Oregon region.

---

# Step 9 — Verify in AWS Console

Go to:

```text
EC2 → Oregon Region (us-west-2)
```

Verify:
- EC2 instance created
- Public IP assigned
- Default VPC used

---

# Terraform Workflow Commands

| Command | Purpose |
|---|---|
| terraform init | Initialize Terraform |
| terraform validate | Validate Terraform syntax |
| terraform fmt | Format Terraform files |
| terraform plan | Preview infrastructure changes |
| terraform apply | Create infrastructure |
| terraform destroy | Delete infrastructure |

---

# Outputs

Terraform displays:
- EC2 Instance ID
- Public IP
- Public DNS

Useful for:
- SSH access
- Infrastructure verification

---

# Troubleshooting

---

## Issue — Invalid AMI ID

### Error

```text
InvalidAMIID.NotFound
```

### Cause

Wrong AMI for selected region.

### Fix

Copy AMI from:
```text
us-west-2
```

region.

---

## Issue — AWS Authentication Failed

### Error

```text
Unable to locate credentials
```

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

## Issue — Region Mismatch

### Cause

Provider region and AMI region differ.

### Fix

Ensure:
- provider region
- AMI region

are same.

---

# Learning Outcomes

This project helps understand:
- Multi-region Terraform deployment
- AWS provider configuration
- Default AWS networking
- Region-specific infrastructure
- EC2 provisioning workflow
- Terraform deployment lifecycle

---

# Cleanup

To avoid AWS charges:

```bash
terraform destroy
```

Deletes Terraform-managed infrastructure.

---

# Future Enhancements

Future improvements:
- Multi-region variables
- Security Groups
- Key Pair integration
- Multi-region VPC deployment
- Terraform modules
- Remote backend

---