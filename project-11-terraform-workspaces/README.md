# Project-11 — Terraform Workspaces & State Isolation

This project demonstrates how to manage multiple isolated Terraform environments using:
- Terraform Workspaces
- Remote Backend (S3)
- DynamoDB State Locking
- Reusable Terraform Modules

The project focuses on solving one of the most important Terraform challenges:
```text
environment state isolation
```

---

# Project Objective

The objective of this project is to:
- Understand Terraform Workspaces
- Learn Terraform state isolation
- Prevent environment overwrite issues
- Manage multiple environments using same Terraform code
- Understand workspace-based infrastructure deployment
- Implement reusable infrastructure with isolated backend state

---

# Problem Statement

In Project-10:
- Dev environment was created successfully
- QA environment deployment destroyed Dev infrastructure

Why?

Because:
```text
all environments shared same Terraform state
```

Backend configuration:

```hcl
key = "project-10/terraform.tfstate"
```

Result:
- Dev state overwritten by QA
- Infrastructure replaced unexpectedly
- Environment conflicts occurred

---

# Root Cause

Terraform state stores:
```text
current infrastructure information
```

When multiple environments use:
```text
same state file
```

Terraform thinks:
```text
existing environment must be modified
```

instead of:
```text
create separate environment
```

---

# Solution

Terraform Workspaces solve this by:
```text
automatically isolating Terraform state
```

Each workspace gets:
- separate state
- separate infrastructure tracking
- separate backend path

---

# Workspace-Based Architecture

```text
Terraform Code
      │
      ├── dev workspace
      │      └── dev state
      │
      ├── qa workspace
      │      └── qa state
      │
      └── prod workspace
             └── prod state
```

---

# Real-Time Enterprise Relevance

Terraform Workspaces are commonly used for:
- dev
- qa
- stage
- prod

environment isolation.

Benefits:
- isolated infrastructure
- safe deployments
- reusable code
- centralized backend

---

# Architecture Overview

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

# Workspace Isolation Architecture

```text
Terraform Workspace
        │
        ├── dev
        │     └── dev state
        │
        ├── qa
        │     └── qa state
        │
        └── prod
              └── prod state
```

---

# Remote Backend Architecture

```text
Terraform
     │
     ├── S3 Backend
     │      └── Terraform State
     │
     └── DynamoDB
            └── State Locking
```

---

# Technologies Used

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
- Terraform Installed
- AWS CLI Configured
- Existing Backend Bootstrap Setup
- Existing S3 Backend Bucket
- Existing DynamoDB Lock Table

---

# Project Structure

```text
project-11-terraform-workspaces/
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

# Terraform Workspace Concept

Terraform Workspaces allow:
```text
same Terraform code
```

to manage:
```text
multiple isolated environments
```

without overwriting infrastructure.

---

# How Workspaces Work

Terraform internally creates:
```text
separate state namespaces
```

Example:

| Workspace | State Path |
|---|---|
| default | project-11/terraform.tfstate |
| dev | env:/dev/project-11/terraform.tfstate |
| qa | env:/qa/project-11/terraform.tfstate |
| prod | env:/prod/project-11/terraform.tfstate |

---

# Important Terraform Behavior

Even though backend configuration contains:

```hcl
key = "project-11/terraform.tfstate"
```

Terraform automatically creates:
```text
workspace-specific backend paths
```

inside S3.

---

# Workspace Flow

---

# Create Workspace

```bash
terraform workspace new dev
```

Creates:
```text
isolated dev state
```

---

# Select Workspace

```bash
terraform workspace select qa
```

Switches Terraform context to:
```text
qa environment
```

---

# Current Workspace

```bash
terraform workspace show
```

Displays:
```text
current active workspace
```

---

# List Workspaces

```bash
terraform workspace list
```

Displays:
```text
all available workspaces
```

---

# Terraform Workspace Variable

Terraform provides:
```hcl
terraform.workspace
```

This automatically returns:
- dev
- qa
- prod

depending on current workspace.

---

# Real-Time Resource Naming

Example:

```hcl
Name = "${var.environment}-vpc"
```

---

# Dev Workspace

Creates:
```text
dev-vpc
dev-ec2
dev-security-group
```

---

# QA Workspace

Creates:
```text
qa-vpc
qa-ec2
qa-security-group
```

---

# Workspace Integration Flow

```text
terraform workspace select dev
        ↓
terraform.workspace = "dev"
        ↓
Root main.tf
        ↓
passes environment = "dev"
        ↓
Modules receive environment variable
        ↓
Resources become:
dev-vpc
dev-ec2
dev-sg
```

---

# Module Architecture

---

# VPC Module

Creates:
- VPC
- Public Subnet
- Internet Gateway
- Route Table

Returns:
- VPC ID
- Subnet ID

---

# Security Group Module

Creates:
- Security Group

Returns:
- Security Group ID

---

# EC2 Module

Creates:
- EC2 Instance

Returns:
- Public IP
- Public DNS

---

# Terraform State Isolation

---

# Project-10 Problem

```text
Single shared state
```

Result:
- environment overwrite
- accidental destroy
- infrastructure replacement

---

# Project-11 Solution

```text
Workspace-isolated state
```

Result:
- safe environments
- isolated infrastructure
- independent deployments

---

# Real-Time Enterprise Importance

Terraform state isolation is critical because:
- environments must remain independent
- production should never overwrite dev
- infrastructure must be safely managed

---

# Terraform Commands Used

---

# Initialize Terraform

```bash
terraform init
```

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

# Create Dev Workspace

```bash
terraform workspace new dev
```

---

# Create QA Workspace

```bash
terraform workspace new qa
```

---

# Create Prod Workspace

```bash
terraform workspace new prod
```

---

# List Workspaces

```bash
terraform workspace list
```

---

# Show Current Workspace

```bash
terraform workspace show
```

---

# Switch Workspace

```bash
terraform workspace select dev
```

OR

```bash
terraform workspace select qa
```

---

# Plan Infrastructure

```bash
terraform plan
```

---

# Apply Infrastructure

```bash
terraform apply
```
---

# Console Outputs & AWS services creation

=============ADD SCREENSHOTS================


---

# Destroy Workspace Infrastructure

```bash
terraform destroy
```

Destroys ONLY:
```text
current workspace infrastructure
```

---

# Delete Workspace

IMPORTANT:
Terraform does NOT allow deleting current workspace.

First switch:

```bash
terraform workspace select default
```

Then delete:

```bash
terraform workspace delete dev
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

# S3 Backend Observation

Terraform automatically created:
```text
env:/dev/
env:/qa/
```

inside S3 backend bucket.

This proves:
```text
workspace state isolation
```

---

# DynamoDB Observation

Terraform automatically created:
```text
separate lock entries per workspace
```

Example:
- env:/dev/project-11/terraform.tfstate
- env:/qa/project-11/terraform.tfstate

---

# Common Issues & Troubleshooting

---

## Issue — QA Destroyed DEV

### Cause

Shared Terraform state.

### Solution

Use:
```text
Terraform Workspaces
```

for isolated state.

---

## Issue — DependencyViolation During Destroy

### Cause

AWS networking dependencies:
- ENIs
- IGW
- Route Tables
- Subnets

still existed inside VPC.

---

## Issue — Long Destroy Time

### Cause

AWS networking cleanup is asynchronous.

Terraform waits for:
- EC2 termination
- ENI release
- network cleanup

---

## Issue — Cannot Delete Current Workspace

### Cause

Terraform protects active workspace.

### Fix

Switch to:
```text
default workspace
```

before deletion.

---

# Important Learning Outcomes

This project helps understand:
- Terraform Workspaces
- State Isolation
- Backend Architecture
- Workspace Lifecycle
- Multi-Environment Management
- Infrastructure Isolation
- Reusable Terraform Architecture
- Enterprise Terraform Design

---

# Key Enterprise Concepts Learned

---

# Same Code

Terraform code remains:
```text
reusable
```

---

# Separate State

Each environment gets:
```text
isolated infrastructure tracking
```

---

# Workspace-Aware Infrastructure

Resource naming dynamically changes based on:
```text
terraform.workspace
```

---

# Backend Isolation

Terraform automatically creates:
```text
workspace-specific backend paths
```

inside S3.

---

# Difference Between Project-10 & Project-11

| Project-10 | Project-11 |
|---|---|
| tfvars-based environments | workspace-based environments |
| shared state | isolated state |
| environments overwrite | environments isolated |
| manual separation | automatic state segregation |

---

# Future Enhancements

Next projects may include:
- Terraform Provisioners
- Dynamic Blocks
- ALB & Auto Scaling
- RDS Infrastructure
- Jenkins + Terraform CI/CD
- GitHub Actions Integration
- EKS Infrastructure

---