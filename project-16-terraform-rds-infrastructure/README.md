# Project-16 — Terraform RDS Infrastructure

This project demonstrates how to build a production-grade 3-tier AWS infrastructure using Terraform.

The infrastructure includes:

* Application Load Balancer (ALB)
* Auto Scaling Group (ASG)
* Private Application EC2 Instances
* Private RDS MySQL Database
* Public & Private Subnets
* NAT Gateway
* Multi-AZ Architecture
* Layered Security Design

This project represents the transition from:

```text
basic infrastructure
```

to:

```text
real enterprise application architecture
```

---

# Project Objective

The main objective of this project is to:

* Build secure 3-tier AWS architecture
* Understand public vs private infrastructure
* Deploy private application servers
* Deploy private RDS database
* Implement layered security
* Learn enterprise networking concepts
* Understand database subnet architecture
* Build scalable infrastructure using Terraform

---

# Real-Time Problem Statement

In insecure architectures:

```text
Internet → Application → Database
```

all layers may become publicly accessible.

This creates:

* security risks
* direct database exposure
* poor architecture design
* weak network isolation

Real enterprise environments require:

* private application layers
* private database layers
* controlled traffic flow
* strict security group communication

This project solves those challenges.

---

# Final Architecture

```text
Internet
   ↓
ALB
   ↓
Private Application EC2
   ↓
Private RDS MySQL
```

This is a production-style:

```text
3-tier architecture
```

---

# Architecture Diagram

```text
                     Internet
                         │
                         ▼
                  Application Load Balancer
                         │
          ┌──────────────┴──────────────┐
          ▼                             ▼

   Public Subnet-1               Public Subnet-2
          │                             │
          ▼                             ▼

   Private App Subnet-1         Private App Subnet-2
          │                             │
          ▼                             ▼

     EC2 Application Servers (ASG)

                         │
                         ▼

      Private DB Subnet-1         Private DB Subnet-2
                 │                          │
                 ▼                          ▼

                 Amazon RDS MySQL
```

---

# Technologies Used

* Terraform
* AWS VPC
* AWS EC2
* AWS ALB
* AWS Auto Scaling Group
* AWS RDS MySQL
* AWS NAT Gateway
* AWS Route Tables
* AWS Internet Gateway
* AWS Security Groups
* AWS Launch Templates
* AWS DB Subnet Groups
* NGINX
* Git & GitHub
* VS Code

---

# AWS Services Created

| Service             | Purpose                           |
| ------------------- | --------------------------------- |
| VPC                 | Main isolated network             |
| Public Subnets      | Host ALB & NAT Gateway            |
| Private App Subnets | Host application EC2              |
| Private DB Subnets  | Host RDS database                 |
| Internet Gateway    | Public internet access            |
| NAT Gateway         | Outbound internet for private EC2 |
| Route Tables        | Traffic routing                   |
| Security Groups     | Layered security                  |
| Launch Template     | EC2 blueprint                     |
| Auto Scaling Group  | Scalable EC2 management           |
| Target Group        | Registers healthy EC2s            |
| ALB                 | Public traffic entry point        |
| DB Subnet Group     | Defines RDS subnet placement      |
| RDS MySQL           | Persistent database storage       |

---

# Layered Infrastructure Design

---

# Public Layer

Contains:

* ALB
* NAT Gateway

Accessible from internet.

---

# Private Application Layer

Contains:

* EC2 instances

Purpose:

* run application/nginx
* process requests

Important:

```text
NO public IPs
```

---

# Private Database Layer

Contains:

* RDS MySQL

Important:

```text
completely private
```

Database is accessible ONLY from:

```text
application EC2
```

through:

```text
Security Group rules
```

---

# Security Architecture

---

# ALB Security Group

Allows:

```text
HTTP traffic from internet
```

---

# EC2 Security Group

Allows:

```text
ONLY ALB → EC2 traffic
```

---

# RDS Security Group

Allows:

```text
ONLY EC2 → MySQL traffic
```

on:

```text
Port 3306
```

This is real enterprise security segmentation.

---

# Key Terraform Concepts Used

* Remote Backend
* State Locking
* Multi-AZ Networking
* NAT Gateway Architecture
* Auto Scaling
* Launch Templates
* DB Subnet Groups
* Security Group Referencing
* user_data Bootstrapping
* RDS Provisioning

---

# Project Structure

```text
project-16-terraform-rds-infrastructure/
│
├── provider.tf
├── backend.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
├── userdata.sh
├── README.md
└── .gitignore
```

---

# userdata.sh Purpose

The `userdata.sh` script automatically:

* installs nginx
* starts nginx
* creates custom webpage
* displays EC2 instance ID

This demonstrates:

```text
cloud-native EC2 bootstrapping
```

---

# Terraform Workflow

---

# Step-1 — Initialize Terraform

```bash
terraform init
```

---

# Step-2 — Validate Configuration

```bash
terraform validate
```

---

# Step-3 — Format Files

```bash
terraform fmt
```

---

# Step-4 — Preview Infrastructure

```bash
terraform plan
```

---

# Step-5 — Deploy Infrastructure

```bash
terraform apply
```

RDS creation may take:

```text
8–15 minutes
```

---

# Step-6 — Access Application

Terraform outputs:

```text
alb_dns_name
```

Open in browser:

```text
http://<ALB-DNS-NAME>
```

---

# Expected Result

You should see:

```text
Project-16 Terraform RDS Infrastructure
```

and:

```text
Instance ID
```

Refreshing browser multiple times should display:

```text
different EC2 instance IDs
```

This proves:

* ALB working
* ASG working
* Target Group healthy
* multi-instance load balancing active

---

# RDS Verification

Go to:

```text
AWS Console → RDS → Databases
```

Verify:

| Check               | Expected                   |
| ------------------- | -------------------------- |
| Status              | Available                  |
| Publicly Accessible | No                         |
| Engine              | MySQL                      |
| DB Subnet Group     | project-16-db-subnet-group |

Most important:

```text
Publicly Accessible = No
```

This proves:

```text
private database architecture
```

---

# Important Architectural Shift

Before:

```text
Internet → EC2 directly
```

Now:

```text
Internet
   ↓
ALB
   ↓
Private App EC2
   ↓
Private RDS MySQL
```

This is the biggest learning outcome of Project-16.

---

# Enterprise Concepts Learned

This project demonstrates:

* 3-tier architecture
* layered networking
* private infrastructure
* secure database deployment
* scalable compute architecture
* self-healing systems
* enterprise traffic flow
* cloud-native automation

---

# Important Learning Outcomes

After this project, you understand:

* public vs private networking
* ALB architecture
* ASG architecture
* NAT Gateway purpose
* DB subnet groups
* RDS networking
* layered security
* private database architecture
* enterprise AWS design

---

# Screenshots

---

# 1. Terraform Init

```text
[ Add terraform init screenshot here ]
```

---

# 2. Terraform Validate

```text
[ Add terraform validate screenshot here ]
```

---

# 3. Terraform Plan

```text
[ Add terraform plan screenshot here ]
```

---

# 4. Terraform Apply

```text
[ Add terraform apply screenshot here ]
```

---

# 5. VPC

```text
[ Add VPC screenshot here ]
```

---

# 6. Public Subnets

```text
[ Add public subnet screenshots here ]
```

---

# 7. Private App Subnets

```text
[ Add private app subnet screenshots here ]
```

---

# 8. Private DB Subnets

```text
[ Add private DB subnet screenshots here ]
```

---

# 9. NAT Gateway

```text
[ Add NAT Gateway screenshot here ]
```

---

# 10. Route Tables

```text
[ Add route table screenshots here ]
```

---

# 11. Application Load Balancer

```text
[ Add ALB screenshot here ]
```

---

# 12. Target Group

```text
[ Add Target Group screenshot here ]
```

---

# 13. Auto Scaling Group

```text
[ Add ASG screenshot here ]
```

---

# 14. EC2 Instances

```text
[ Add EC2 screenshots here ]
```

---

# 15. RDS Database Overview

```text
[ Add RDS overview screenshot here ]
```

---

# 16. RDS Connectivity & Security

```text
[ Add RDS connectivity & security screenshot here ]
```

---

# 17. Browser Output

```text
[ Add ALB browser output screenshot here ]
```

---

# 18. Instance ID Rotation Proof

```text
[ Add multiple browser refresh screenshots here ]
```

---

# 19. EC2 Without Public IP

```text
[ Add EC2 private IP screenshot here ]
```

---

# 20. Terraform Destroy

```text
[ Add terraform destroy screenshot here ]
```

---

# Real Enterprise Relevance

This architecture pattern is widely used for:

* enterprise applications
* APIs
* SaaS platforms
* microservices
* internal applications

---

# Best Practices

Never commit:

* `.terraform`
* `.tfstate`
* `.pem`
* secrets
* provider binaries

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

Future improvements may include:

* Bastion Host
* Multi-AZ RDS
* Read Replicas
* Route53
* HTTPS with ACM
* CloudFront
* WAF
* Monitoring Stack
* CI/CD Integration
* EKS Integration

---