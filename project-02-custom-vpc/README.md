# Terraform AWS VPC Hands-On

This project demonstrates how to create a custom AWS VPC infrastructure using Terraform.

The hands-on covers:
- VPC creation
- Public and Private Subnets
- Internet Gateway (IGW)
- Route Tables
- Route Table Associations
- Terraform networking concepts
- Infrastructure as Code (IaC)

---

# Architecture Overview

```text
VPC
├── Public Subnet
├── Private Subnet
├── Internet Gateway
├── Public Route Table
└── Private Route Table
```

---

# Application-Level Architecture

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
Frontend / UI Layer

Private Communication
  ↓

Private Subnet
  ↓
Backend / Database Layer
```

---

# Technologies Used

- Terraform
- AWS VPC
- AWS Subnets
- Internet Gateway
- Route Tables
- AWS CLI
- Git & GitHub

---

# Project Structure

```text
terraform-vpc-handson/
│
├── provider.tf
├── vpc.tf
├── outputs.tf
├── .gitignore
└── README.md
```

---

# Terraform Files

## provider.tf

Defines:
- AWS Provider
- Terraform Provider Configuration
- AWS Region

---

## vpc.tf

Defines:
- VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- Public Route Table
- Private Route Table
- Route Table Associations

---

## outputs.tf

Displays:
- VPC ID
- Public Subnet ID
- Private Subnet ID

---

# VPC Components Explained

| Component | Purpose |
|---|---|
| VPC | Isolated AWS network |
| Public Subnet | Internet-facing resources |
| Private Subnet | Internal secure resources |
| Internet Gateway | Connects VPC to internet |
| Route Table | Controls traffic routing |
| Route Association | Connects subnet to route table |

---

# Public vs Private Subnet

## Public Subnet

Public subnet requires:
- Public IP assignment
- Route to Internet Gateway

Used for:
- Frontend Servers
- Load Balancers
- Bastion Hosts

---

## Private Subnet

Private subnet:
- Has no direct internet access
- Used for internal resources

Used for:
- Backend APIs
- Databases

---

# Terraform Workflow

## Initialize Terraform

```bash
terraform init
```

Downloads required Terraform provider plugins.

---

## Format Terraform Files

```bash
terraform fmt
```

Formats Terraform code.

---

## Validate Terraform Code

```bash
terraform validate
```

Validates Terraform syntax.

---

## Review Infrastructure Plan

```bash
terraform plan
```

Displays infrastructure changes before deployment.

---

## Provision Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

Terraform provisions AWS networking infrastructure.

---

# Outputs

Terraform outputs:
- VPC ID
- Public Subnet ID
- Private Subnet ID

Useful for:
- EC2 deployment
- Security Groups
- Future Terraform modules

---

# Real-Time Networking Flow

```text
User
 ↓
Internet
 ↓
Internet Gateway
 ↓
Public Route Table
 ↓
Public Subnet
 ↓
Frontend Layer
 ↓
Private VPC Communication
 ↓
Private Subnet
 ↓
Backend / Database Layer
```

---

# Important Terraform Concepts Learned

- Infrastructure as Code (IaC)
- Resource Dependencies
- Terraform References
- Public vs Private Networking
- Route Tables
- Internet Connectivity
- Terraform Outputs

---

# Cleanup

To avoid unnecessary AWS billing:

```bash
terraform destroy
```

Deletes all Terraform-managed infrastructure.

---
