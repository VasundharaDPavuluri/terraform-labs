# Project-10 — Terraform Multi-Environment Infrastructure

This project demonstrates how to manage multiple environments using Terraform with reusable modules and environment-specific configurations.

The project deploys:
- Dev Environment
- QA Environment
- Production Environment

using:
- Same Terraform code
- Same reusable modules
- Different `.tfvars` files

---

# Project Objective

The objective of this project is to:
- Understand Terraform environment management
- Reuse infrastructure modules across environments
- Separate infrastructure configuration from infrastructure logic
- Learn environment-based deployments
- Understand Terraform state challenges in multi-environment setups

---

# Real-Time Scenario

In real organizations:
- Dev environment is used for development
- QA environment is used for testing
- Prod environment is used for live production workloads

Each environment:
- has different configurations
- may use different instance sizes
- may use different networking ranges
- may scale differently

But:
```text
same infrastructure code is reused
```

---

# Architecture Overview

```text
Terraform Root Module
        │
        ├── Environment Configurations
        │      ├── dev.tfvars
        │      ├── qa.tfvars
        │      └── prod.tfvars
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

# Environment Architecture

```text
Same Terraform Code
        │
        ├── Dev Configuration
        ├── QA Configuration
        └── Prod Configuration
```

Infrastructure logic remains same.

Only:
- CIDRs
- instance types
- environment names
- scaling values

change.

---

# Technologies Used

- Terraform
- AWS EC2
- AWS VPC
- AWS S3 Backend
- AWS DynamoDB
- Git & GitHub
- VS Code

---

# Prerequisites

Before starting this project:

- AWS Account
- Terraform Installed
- AWS CLI Configured
- Existing S3 Backend
- Existing DynamoDB Lock Table

---

# Project Structure

```text
project-10-terraform-environments/
│
├── provider.tf
├── backend.tf
├── variables.tf
├── main.tf
├── outputs.tf
├── .gitignore
├── README.md
│
├── environments/
│   │
│   ├── dev.tfvars
│   ├── qa.tfvars
│   └── prod.tfvars
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

# Terraform Environment Concept

Terraform environments allow:
```text
same infrastructure code
```

to deploy:
```text
different infrastructure configurations
```

using:
```text
different variable files
```

---

# Environment Configurations

---

# Dev Environment

Purpose:
- developer testing
- learning
- experimentation

Configuration:
- small EC2 instance
- low-cost infrastructure

---

# QA Environment

Purpose:
- testing
- validation
- integration testing

Configuration:
- medium infrastructure
- isolated network

---

# Production Environment

Purpose:
- live workloads
- production traffic

Configuration:
- larger instance type
- production-ready infrastructure

---

# Environment Variable Files

---

# dev.tfvars

Contains:
- Dev CIDR ranges
- Dev instance size
- Dev environment values

---

# qa.tfvars

Contains:
- QA CIDR ranges
- QA instance size
- QA environment values

---

# prod.tfvars

Contains:
- Production CIDR ranges
- Production instance size
- Production environment values

---

# Important Terraform Learning

---

# Infrastructure Logic vs Configuration

---

# Infrastructure Logic

Stored in:
```text
Terraform modules
```

Examples:
- VPC creation
- EC2 creation
- subnet creation

Logic remains same across environments.

---

# Environment Configuration

Stored in:
```text
tfvars files
```

Examples:
- CIDRs
- instance types
- environment names

Configuration changes per environment.

---

# Root Module Responsibilities

The Root Module:
- calls child modules
- passes environment values
- orchestrates infrastructure

---

# Child Module Responsibilities

Child modules:
- create reusable infrastructure
- receive inputs
- return outputs

---

# Module Communication

Terraform modules communicate using:
- inputs
- outputs

Modules NEVER directly communicate with each other.

---

# Terraform State Learning

This project intentionally demonstrates:
```text
shared Terraform state issue
```

Current backend configuration:

```hcl
key = "project-10/terraform.tfstate"
```

This means:
```text
all environments share same state
```

---

# Important Observation

If:
- Dev infrastructure is deployed
- QA configuration is applied next

Terraform may:
- destroy Dev
- recreate QA

because:
```text
same state file is reused
```

---

# Real-Time Enterprise Solution

Real organizations use:
```text
isolated state per environment
```

Examples:

| Environment | State File |
|---|---|
| Dev | dev.tfstate |
| QA | qa.tfstate |
| Prod | prod.tfstate |

---

# Learning Outcome

This project helps understand:
- environment separation
- tfvars usage
- reusable infrastructure
- state management challenges
- enterprise Terraform design

---

# Terraform Commands Used

---

# Initialize Terraform

```bash
terraform init
```

Purpose:
- initialize providers
- initialize backend
- initialize modules

---

# Validate Configuration

```bash
terraform validate
```

---

# Format Terraform Files

```bash
terraform fmt
```

---

# Deploy Dev Environment

```bash
terraform apply -var-file="environments/dev.tfvars"
```

---

# Deploy QA Environment

```bash
terraform apply -var-file="environments/qa.tfvars"
```

---

# Deploy Production Environment

```bash
terraform apply -var-file="environments/prod.tfvars"
```

---

# Destroy Dev Environment

```bash
terraform destroy -var-file="environments/dev.tfvars"
```

---

# Destroy QA Environment

```bash
terraform destroy -var-file="environments/qa.tfvars"
```

---

# Destroy Production Environment

```bash
terraform destroy -var-file="environments/prod.tfvars"
```

---

# View Managed Resources

```bash
terraform state list
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
- Security Group ID
- EC2 Public IP
- EC2 Public DNS
---
## Dev Env
### AWS - VPC Created - dev
<img width="1897" height="692" alt="Screenshot 2026-05-18 224335" src="https://github.com/user-attachments/assets/2bf07136-406d-4e8f-9059-f7530ba435e5" />

### AWS - Security Group Created - dev
<img width="1919" height="260" alt="Screenshot 2026-05-18 224346" src="https://github.com/user-attachments/assets/ac9265a5-1eca-490a-aca7-5b56d1628664" />

### AWS - Instance Created - dev
<img width="1919" height="198" alt="Screenshot 2026-05-18 224358" src="https://github.com/user-attachments/assets/a93edf3a-9dcc-4aa8-b633-abb37b8c0190" />

## QA Env
### AWS - VPC Creared - qa
<img width="1919" height="669" alt="Screenshot 2026-05-18 231906" src="https://github.com/user-attachments/assets/08e96424-ed55-4b94-85aa-200ed838d277" />

### AWS - Security Group created - qa
<img width="1919" height="228" alt="Screenshot 2026-05-18 231917" src="https://github.com/user-attachments/assets/fa978683-ccad-4fa3-ae67-071a9d7391e4" />

### AWS - Instance created - qa
<img width="1919" height="310" alt="Screenshot 2026-05-18 232238" src="https://github.com/user-attachments/assets/09a8d5fb-10d1-404a-af4b-2ee930a3305c" />

#### Note: 
I have reused project-09 scripts for this project-10, so services names are still project-09.

---

# Common Issues & Troubleshooting

---

## Issue — Dev Destroyed While Creating QA

### Cause

All environments shared:
```text
same Terraform state
```

### Explanation

Terraform compared:
```text
existing dev state
vs
desired qa configuration
```

and replaced infrastructure.

### Learning

Terraform environments require:
```text
isolated state
```

---

## Issue — DependencyViolation During VPC Delete - For PoCs

### Cause

Resources still existed inside VPC:
- ENIs
- IGW
- Route Tables
- Subnets

### Fix

Remove remaining dependencies before VPC deletion.

---

## Issue — Long Destroy Operations

### Cause

AWS networking cleanup is asynchronous.

### Explanation

AWS may take time to:
- detach ENIs
- terminate EC2
- release networking resources

---

# Real-Time Enterprise Importance

This project represents:
```text
multi-environment infrastructure management
```

which is a critical enterprise Terraform skill.

---

# Future Improvements

Next projects may improve:
- state isolation
- Terraform workspaces
- multi-environment backend strategy
- CI/CD integration

---
