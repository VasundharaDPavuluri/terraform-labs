# Project-12 — Terraform Provisioners & EC2 Bootstrapping

This project demonstrates how to automate server configuration using:
- Terraform Provisioners
- SSH-based Remote Execution
- EC2 Bootstrapping
- Infrastructure + Configuration Automation

The project creates AWS infrastructure and automatically installs/configures NGINX inside the EC2 instance during Terraform deployment.

---

# Project Objective

The objective of this project is to:
- Understand Terraform Provisioners
- Learn infrastructure bootstrapping
- Automate EC2 server configuration
- Use SSH-based remote execution
- Understand Terraform automation workflow
- Learn the difference between Infrastructure Provisioning and Configuration Management

---

# Real-Time Problem Statement

Normally, Terraform creates:
```text
empty infrastructure
```

Example:
- EC2 instance created
- server accessible
- but no software installed

Then DevOps engineers manually:
- SSH into server
- install packages
- configure applications
- start services

This creates:
```text
manual operational effort
```

and:
```text
inconsistent server setup
```

---

# Solution

Terraform Provisioners allow Terraform to:
```text
execute commands after infrastructure creation
```

Terraform automatically:
- connects to EC2 using SSH
- installs required software
- configures services
- starts applications

during deployment itself.

---

# Project Architecture

```text
Terraform
    │
    ├── VPC
    ├── Public Subnet
    ├── Internet Gateway
    ├── Route Table
    ├── Security Group
    └── EC2 Instance
             │
             └── Provisioners
                    │
                    ├── SSH Connection
                    ├── remote-exec
                    └── local-exec
```

---

# End-to-End Flow

```text
Terraform Apply
      ↓
Create AWS Infrastructure
      ↓
Launch EC2 Instance
      ↓
Read EC2 Public IP
      ↓
Connect Using SSH
      ↓
Run Linux Commands
      ↓
Install NGINX
      ↓
Start NGINX Service
      ↓
Website Accessible in Browser
```

---

# Technologies Used

- Terraform
- AWS EC2
- AWS VPC
- AWS S3 Backend
- AWS DynamoDB
- SSH
- NGINX
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
- Existing EC2 Key Pair
- PEM Key Available Locally

---

# Project Structure

```text
project-12-terraform-provisioners/
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

# Infrastructure Components

This project creates:

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Route Table Association
- Security Group
- EC2 Instance

---

# Provisioners Used

---

# 1. remote-exec

Runs commands:
```text
inside EC2 server
```

Used for:
- package installation
- service configuration
- server bootstrap

Example:
- install nginx
- start nginx service

---

# 2. local-exec

Runs commands:
```text
on local machine
```

Used for:
- notifications
- local logging
- automation hooks

---

# 3. connection Block

Defines:
```text
how Terraform connects to EC2
```

Using:
- SSH
- PEM Key
- EC2 Public IP

---

# Terraform Provisioner Workflow

```text
Terraform
    ↓
Create EC2
    ↓
Read Public IP
    ↓
Use PEM Key
    ↓
SSH into Server
    ↓
Execute Commands
    ↓
Configure Server
```

---

# Main Terraform Learning

Terraform can now:
```text
create infrastructure
+
configure infrastructure
```

inside SAME workflow.

---

# Why Provisioners Are Important

Provisioners help automate:
- initial server setup
- package installation
- lightweight configuration
- proof-of-concept automation

---

# NGINX Bootstrap Commands Used

Terraform automatically executes:

```bash
sudo yum update -y
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
```

---

# SSH Authentication

Terraform uses:
- EC2 Key Pair
- PEM file
- SSH connection

to connect to EC2.

---

# Important Variables

---

# key_name

Used by:
```text
EC2 instance
```

for SSH access.

---

# private_key_path

Used by:
```text
Terraform remote-exec
```

to authenticate into EC2.

Example:

```hcl
private_key_path = "C:/Users/username/Downloads/key_terraform.pem"
```

---

# Important Terraform Files

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
- Terraform provisioners

---

# outputs.tf

Displays:
- EC2 Public IP
- VPC ID
- subnet ID
- Security Group ID

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

# Destroy Infrastructure

```bash
terraform destroy
```

---

# Recreate EC2 Resource

```bash
terraform taint aws_instance.project_ec2
```

Used to:
```text
force EC2 recreation
```

and rerun provisioners.

---

# Outputs

Terraform displays:
- EC2 Instance ID
- Public IP
- Public DNS
- VPC ID
- subnet ID
- Security Group ID

---

# Verification

After successful deployment:

Open browser:

```text
http://<EC2-PUBLIC-IP>
```

Expected Result:

```text
Welcome to nginx
```

---

# Screenshots

---

# AWS Infrastructure Screenshots

Add screenshots for:
- VPC
- Subnet
- Route Table
- Internet Gateway
- Security Group
- EC2 Instance

```text
[ Add AWS Console Screenshots Here ]
```

---

# Terraform Apply Output

Add screenshot showing:
- remote-exec execution
- SSH connection
- nginx installation

```text
[ Add Terraform Console Output Screenshot Here ]
```

---

# NGINX Verification

Add screenshot showing:
```text
Welcome to nginx
```

page from browser.

```text
[ Add NGINX Browser Screenshot Here ]
```

---

# Important Real-Time Learning

Terraform Provisioners execute:
```text
during resource lifecycle
```

mostly:
- during creation
- sometimes during destroy

Provisioners DO NOT automatically rerun on every apply.

---

# Why Provisioners Did Not Run Again

Terraform detected:
```text
No infrastructure changes
```

So provisioners were skipped.

To rerun provisioners:
```bash
terraform taint aws_instance.project_ec2
```

was used.

---

# Important Difference

Terraform is:
```text
Infrastructure as Code Tool
```

NOT:
```text
continuous configuration management tool
```

This is VERY important understanding.

---

# Why Enterprises Prefer Configuration Management Tools

Large organizations often prefer:
- Ansible
- Chef
- Puppet
- cloud-init
- Packer

instead of heavy Terraform provisioners.

---

# Why?

Because Terraform provisioners can become:
```text
operationally fragile
```

at scale.

---

# Common Problems With Provisioners

---

# SSH Dependency

Provisioners depend on:
- network access
- SSH availability
- security groups
- PEM files

Failures are common.

---

# Limited Reusability

Provisioners are harder to:
- version
- reuse
- manage at scale

compared to configuration tools.

---

# Not Idempotent

Provisioners may:
- rerun unexpectedly
- fail partially
- create inconsistent states

---

# Separation of Concerns

Best practice:

| Tool | Responsibility |
|---|---|
| Terraform | Infrastructure Provisioning |
| Ansible/Chef | Server Configuration |

---

# Real Enterprise Pattern

---

# Terraform

Creates:
- VPC
- EC2
- Load Balancer
- Networking

---

# Configuration Management Tool

Configures:
- packages
- applications
- users
- services

---

# Better Enterprise Alternatives

---

# cloud-init / user_data

Most common lightweight EC2 bootstrap approach.

Advantages:
- simpler
- native EC2 initialization
- no SSH dependency

---

# Ansible

Most common enterprise configuration tool.

Advantages:
- idempotent
- reusable
- scalable
- inventory-driven

---

# Packer

Used to:
```text
pre-build machine images
```

with applications already installed.

Very common in enterprise DevOps.

---

# Key Learning Outcomes

This project helps understand:
- Terraform Provisioners
- SSH Automation
- EC2 Bootstrapping
- Infrastructure Automation
- Server Initialization
- Remote Execution
- Infrastructure Lifecycle
- Provisioner Limitations
- Enterprise Automation Patterns

---

# Real-Time Enterprise Relevance

This project represents:
```text
infrastructure bootstrapping automation
```

which is an important DevOps engineering concept.

---

# Future Improvements

Next projects may include:
- user_data
- cloud-init
- loops & dynamic blocks
- ALB
- Auto Scaling
- Launch Templates
- Jenkins Integration
- Kubernetes Infrastructure

---