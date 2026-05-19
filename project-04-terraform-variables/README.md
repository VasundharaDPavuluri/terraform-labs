# Terraform Variables Project

This project demonstrates how to use Terraform Variables to create reusable and dynamic AWS infrastructure.

The project provisions:
- Custom VPC
- Public Subnet
- Security Group
- EC2 Instance

using Terraform variables instead of hardcoded values.

---

# Project Objective

The goal of this project is to understand:
- Terraform input variables
- Dynamic infrastructure configuration
- Reusable Terraform code
- Infrastructure parameterization

---

# Technologies Used

- Terraform
- AWS EC2
- AWS VPC
- AWS Security Groups
- AWS CLI
- Git & GitHub

---

# Project Structure

```text
terraform_var_project/
│
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── vpc.tf
├── subnet.tf
├── security-group.tf
├── ec2-instance.tf
├── outputs.tf
├── .gitignore
└── README.md
```

---

# Terraform Files Explained

| File | Purpose |
|---|---|
| provider.tf | AWS provider configuration |
| variables.tf | Defines input variables |
| terraform.tfvars | Stores variable values |
| vpc.tf | Creates VPC |
| subnet.tf | Creates subnet |
| security-group.tf | Creates security group |
| ec2-instance.tf | Creates EC2 instance |
| outputs.tf | Displays output values |

---

# What Are Variables in Terraform?

Variables are used to make Terraform code:
- reusable
- flexible
- configurable

Instead of hardcoding values directly in Terraform files.

---

# Without Variables

```hcl
instance_type = "t2.micro"
```

Hardcoded value.

---

# With Variables

```hcl
instance_type = var.instance_type
```

Dynamic value.

Terraform takes value from:
```text
terraform.tfvars
```

---

# variables.tf Example

```hcl
variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}
```

---

# terraform.tfvars Example

```hcl
instance_type = "t2.micro"
region        = "ap-south-1"
```

---

# Why Variables Are Important

Variables help:
- avoid hardcoding
- reuse same Terraform code
- manage multiple environments
- simplify infrastructure changes

---

# Real-Time Example

Same Terraform code can deploy:

| Environment | Instance Type |
|---|---|
| Dev | t2.micro |
| QA | t3.small |
| Prod | t3.large |

without modifying actual Terraform resource files.

---

# Infrastructure Architecture

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
EC2 Instance
```

---

# Terraform Workflow

## Initialize Terraform

```bash
terraform init
```

Downloads required Terraform providers.

---

## Format Terraform Files

```bash
terraform fmt
```

Formats Terraform code.

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

Shows infrastructure changes before deployment.

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

# Key Terraform Concepts Learned

- Input Variables
- Terraform References
- Infrastructure Reusability
- Dynamic Configuration
- AWS Networking
- Security Groups
- EC2 Provisioning
- Infrastructure as Code (IaC)

---

# Outputs

Terraform displays:
- VPC ID
- Subnet ID
- EC2 Public IP
- Security Group ID

using:
```text
outputs.tf
```
---
On AWS:

<img width="1917" height="309" alt="Screenshot 2026-05-14 142455-1" src="https://github.com/user-attachments/assets/a95b90d2-30eb-4ac5-b93f-a32e0e072e02" />
<img width="1917" height="338" alt="Screenshot 2026-05-14 142455-2" src="https://github.com/user-attachments/assets/53b75ccb-8931-41c5-ae9b-cf49daeae281" />
<img width="1918" height="339" alt="Screenshot 2026-05-14 142417" src="https://github.com/user-attachments/assets/241c5427-0f4c-4ee6-be2f-86cd011738bd" />
<img width="1919" height="244" alt="Screenshot 2026-05-14 142435-1" src="https://github.com/user-attachments/assets/959f1428-a714-4d53-8772-5930d6000675" />


---

# Learning Outcome

This project helps understand:
- How Terraform variables work
- How to create reusable infrastructure
- How to parameterize AWS resources
- How Terraform handles dynamic values
- Real-time infrastructure configuration practices

---

# Future Enhancements

Future topics:
- Terraform Modules
- Remote Backend
- NAT Gateway
- Load Balancer
- Auto Scaling
- RDS Integration
- Jenkins CI/CD Integration

---
