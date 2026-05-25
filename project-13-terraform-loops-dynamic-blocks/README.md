# Project-13 — Terraform Loops & Dynamic Blocks

This project demonstrates how to create scalable and dynamic AWS infrastructure using Terraform loops and dynamic blocks.

The project focuses on:
- Multiple EC2 creation using `count`
- Dynamic Security Group rules using `dynamic`
- Reusable and scalable Infrastructure as Code (IaC)

This project represents an important transition from:
```text
manual infrastructure
```

to:
```text
programmable infrastructure
```

---

# Project Objective

The objective of this project is to:
- Understand Terraform loops
- Learn scalable infrastructure design
- Create multiple EC2 instances dynamically
- Create dynamic Security Group rules
- Reduce repetitive Terraform code
- Understand enterprise Terraform patterns

---

# Real-Time Problem Statement

Without loops, infrastructure becomes repetitive.

Example:

```hcl
resource "aws_instance" "server1" {}

resource "aws_instance" "server2" {}

resource "aws_instance" "server3" {}
```

Problems:
- repetitive code
- difficult maintenance
- poor scalability
- error-prone infrastructure

This becomes unmanageable in enterprise environments where:
- dozens of EC2s
- multiple SG rules
- multiple subnets
- multi-environment deployments

must be maintained.

---

# Solution

Terraform loops allow:
```text
dynamic infrastructure creation
```

using:
- variables
- loops
- reusable logic

This project uses:
- `count`
- `dynamic`
- `for_each`

to automate infrastructure scaling.

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
    ├── Dynamic Security Group
    │
    └── Multiple EC2 Instances
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
Create Internet Gateway
      ↓
Create Route Table
      ↓
Create Dynamic Security Group Rules
      ↓
Create Multiple EC2 Instances
```

---

# Technologies Used

- Terraform
- AWS EC2
- AWS VPC
- AWS Security Groups
- AWS Route Tables
- AWS Internet Gateway
- AWS S3 Backend
- AWS DynamoDB
- Git & GitHub
- VS Code

---

# Prerequisites

Before starting:

- AWS Account
- Terraform Installed
- AWS CLI Installed
- AWS CLI Configured
- Existing Backend Bootstrap Setup
- Existing S3 Backend Bucket
- Existing DynamoDB Lock Table

---

# Project Structure

```text
project-13-terraform-loops-dynamic-blocks/
│
├── provider.tf
├── backend.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
├── .gitignore
└── README.md
```

---

# Main Terraform Concepts Used

---

# 1. count

Used for:
```text
multiple EC2 creation
```

Example:

```hcl
count = var.instance_count
```

Terraform automatically creates:
- EC2-1
- EC2-2
- EC2-3

based on variable value.

---

# 2. dynamic Block

Used for:
```text
dynamic Security Group ingress rules
```

Instead of manually writing:
- SSH rule
- HTTP rule
- HTTPS rule

Terraform automatically generates rules dynamically.

---

# 3. for_each

Used inside:
```text
dynamic block
```

Terraform loops through:
```text
allowed_ports
```

one-by-one.

---

# Terraform Variables Used

---

# instance_count

Controls:
```text
number of EC2 instances
```

Example:

```hcl
instance_count = 3
```

---

# allowed_ports

Controls:
```text
dynamic Security Group ports
```

Example:

```hcl
allowed_ports = [22, 80, 443]
```

Terraform dynamically creates:
- SSH rule
- HTTP rule
- HTTPS rule

---

# Infrastructure Components

---

# 1. VPC

Creates:
```text
isolated AWS network
```

---

# 2. Public Subnet

Creates:
```text
internet-accessible subnet
```

---

# 3. Internet Gateway

Enables:
```text
internet connectivity
```

---

# 4. Route Table

Defines:
```text
network traffic routes
```

---

# 5. Dynamic Security Group

Automatically creates ingress rules dynamically.

---

# 6. Multiple EC2 Instances

Creates multiple EC2 instances using:
```text
Terraform count loop
```

---

# Terraform Files Explanation

---

# provider.tf

Configures:
- AWS provider
- AWS region

---

# backend.tf

Configures:
- S3 remote backend
- DynamoDB locking

---

# variables.tf

Defines:
- reusable Terraform variables

---

# terraform.tfvars

Stores:
- actual variable values

---

# main.tf

Contains:
- AWS infrastructure resources
- loops
- dynamic blocks

---

# outputs.tf

Displays:
- EC2 Public IPs
- EC2 IDs
- VPC ID
- subnet ID
- Security Group ID

---

# Terraform Workflow

---

# Step-1 — Initialize Terraform

```bash
terraform init
```

Downloads:
- providers
- plugins

---

# Step-2 — Validate Configuration

```bash
terraform validate
```

Checks:
- syntax
- configuration validity

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

Terraform shows:
- multiple EC2 resources
- dynamic ingress rules

Example:

```text
aws_instance.project_ec2[0]
aws_instance.project_ec2[1]
aws_instance.project_ec2[2]
```

---

# Step-5 — Deploy Infrastructure

```bash
terraform apply
```

Creates:
- VPC
- subnet
- SG
- multiple EC2 instances

---

# Step-6 — Destroy Infrastructure

```bash
terraform destroy
```

Deletes all created infrastructure.

---

# Outputs

Terraform displays:
- multiple EC2 public IPs
- multiple EC2 instance IDs
- VPC ID
- subnet ID
- Security Group ID

---

# Important Output Syntax

Example:

```hcl
aws_instance.project_ec2[*].public_ip
```

The `[*]` means:
```text
collect values from ALL instances
```

---

# Verification

After deployment:
- verify 3 EC2 instances in AWS Console
- verify SG rules
- verify VPC and subnet
- verify public IPs

---

# AWS Console Verification

You should observe:

---

# EC2 Instances

Terraform creates:
- project-13-ec2-1
- project-13-ec2-2
- project-13-ec2-3

---

# Dynamic Security Group Rules

Terraform automatically creates:
- Port 22
- Port 80
- Port 443

without manually writing multiple ingress blocks.

---

# Screenshots

---

# AWS Infrastructure Screenshots

Add screenshots for:
- VPC
- subnet
- Security Group
- EC2 instances
- route table

```text
[ Add AWS Console Screenshots Here ]
```

---

# Terraform Console Output

Add screenshots for:
- terraform init
- terraform plan
- terraform apply

```text
[ Add Terraform Console Output Here ]
```

---

# Multiple EC2 Verification

Add screenshot showing:
- 3 EC2 instances running

```text
[ Add EC2 Running Instances Screenshot Here ]
```

---

# Dynamic Security Group Verification

Add screenshot showing:
- dynamic ingress rules

```text
[ Add Security Group Rules Screenshot Here ]
```

---

# Important Learning Outcomes

This project helps understand:
- Terraform Loops
- Dynamic Infrastructure
- count
- for_each
- dynamic blocks
- scalable Terraform design
- reusable infrastructure logic

---

# Major Conceptual Shift

Before this project:

```text
Terraform = resource creation
```

After this project:

```text
Terraform = programmable infrastructure
```

This is one of the most important Terraform learning milestones.

---

# Real-Time Enterprise Relevance

Loops and dynamic blocks are heavily used in enterprise Terraform for:
- multiple EC2 instances
- subnet creation
- SG rules
- route tables
- IAM policies
- EKS node groups
- multi-region infrastructure

Without loops:
```text
Terraform becomes unmaintainable
```

at scale.

---

# Terraform State Loss Incident (Important Learning)

During this project, backend bootstrap resources were deleted before destroying infrastructure.

This caused:
```text
Terraform state loss
```

Terraform could no longer:
- track resources
- destroy infrastructure
- manage deployed resources

This demonstrated:
```text
importance of remote state management
```

---

# Key Learning from State Loss

Terraform state is:
```text
Terraform's memory
```

Without state:
Terraform becomes:
```text
blind to infrastructure
```

This is why:
- S3 backend
- DynamoDB locking
- backend protection

are critical in enterprise environments.

---

# Correct Terraform Destroy Order

Always destroy:
```text
infrastructure projects FIRST
```

Then destroy:
```text
backend bootstrap LAST
```

Correct sequence:

```text
Project-13
↓
Project-12
↓
Project-11
↓
...
↓
Project-07 backend LAST
```

---

# Important Best Practices

Terraform repositories should NEVER commit:
- `.terraform`
- `.tfstate`
- `.pem`
- provider binaries
- secrets

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

# Future Enhancements

Next improvements may include:
- Auto Scaling Group
- Load Balancer
- Multi-AZ infrastructure
- RDS
- EKS
- Jenkins Integration
- CI/CD Pipelines

---