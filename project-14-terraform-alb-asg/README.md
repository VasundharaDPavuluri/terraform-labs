# Project-14 — Terraform ALB + Auto Scaling Group Infrastructure

This project demonstrates how to build a highly available, scalable, and self-healing infrastructure on AWS using Terraform.

The project provisions:
- Application Load Balancer (ALB)
- Auto Scaling Group (ASG)
- Launch Template
- Multi-AZ Public Infrastructure
- Dynamic EC2 provisioning
- NGINX bootstrapping using `user_data`

This project represents a major transition from:
```text
single-server infrastructure
```

to:
```text
production-grade distributed architecture
```

---

# Project Objective

The objective of this project is to:
- Understand Load Balancer architecture
- Learn Auto Scaling infrastructure
- Build highly available infrastructure
- Deploy multi-AZ architecture
- Learn Launch Templates
- Automate EC2 bootstrapping using `user_data`
- Understand enterprise traffic flow
- Learn self-healing infrastructure concepts

---

# Real-Time Problem Statement

Single EC2 architecture has major problems:

- single point of failure
- no scalability
- downtime during failures
- unable to handle high traffic
- manual recovery process

Example:

```text
User → Single EC2
```

If EC2 crashes:
```text
application becomes unavailable
```

This is NOT production-grade architecture.

---

# Solution

AWS provides:
- Application Load Balancer (ALB)
- Auto Scaling Group (ASG)
- Multi-AZ infrastructure

to build:
```text
highly available scalable systems
```

Terraform automates this entire architecture using Infrastructure as Code (IaC).

---

# Project Architecture

```text
                         Internet Users
                                │
                                ▼
                  ┌────────────────────────┐
                  │ Application Load       │
                  │ Balancer (ALB)         │
                  │ Port 80                │
                  └────────────────────────┘
                                │
                ┌───────────────┴───────────────┐
                ▼                               ▼

      ┌──────────────────┐          ┌──────────────────┐
      │ Availability     │          │ Availability     │
      │ Zone 1           │          │ Zone 2           │
      │ ap-south-1a      │          │ ap-south-1b      │
      └──────────────────┘          └──────────────────┘
                │                               │
                ▼                               ▼

      ┌──────────────────┐          ┌──────────────────┐
      │ Public Subnet 1  │          │ Public Subnet 2  │
      │ 10.0.1.0/24      │          │ 10.0.2.0/24      │
      └──────────────────┘          └──────────────────┘
                │                               │
                └───────────────┬───────────────┘
                                │
                                ▼

                  ┌────────────────────────┐
                  │ Auto Scaling Group     │
                  │ Desired Capacity = 2   │
                  │ Min Size = 2           │
                  │ Max Size = 3           │
                  └────────────────────────┘
                                │
               ┌────────────────┴────────────────┐
               ▼                                 ▼

      ┌──────────────────┐          ┌──────────────────┐
      │ EC2 Instance-1   │          │ EC2 Instance-2   │
      │ NGINX Installed  │          │ NGINX Installed  │
      │ via user_data    │          │ via user_data    │
      └──────────────────┘          └──────────────────┘
               │                                 │
               └────────────────┬────────────────┘
                                │
                                ▼

                  ┌────────────────────────┐
                  │ Target Group           │
                  │ Health Checks          │
                  │ Port 80                │
                  └────────────────────────┘
```

---

# Infrastructure Flow

```text
Terraform Apply
      ↓
Create VPC
      ↓
Create Public Subnets
      ↓
Create Internet Gateway
      ↓
Create Route Table
      ↓
Create Security Groups
      ↓
Create Launch Template
      ↓
Create Target Group
      ↓
Create Application Load Balancer
      ↓
Create ALB Listener
      ↓
Create Auto Scaling Group
      ↓
ASG launches EC2 Instances
      ↓
user_data installs NGINX
      ↓
Target Group Health Checks Pass
      ↓
ALB starts routing traffic
```

---

# Technologies Used

- Terraform
- AWS EC2
- AWS VPC
- AWS ALB
- AWS Auto Scaling Group
- AWS Launch Template
- AWS Security Groups
- AWS Route Tables
- AWS Internet Gateway
- AWS S3 Backend
- AWS DynamoDB
- NGINX
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
project-14-terraform-alb-asg/
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

# Major AWS Components

---

# 1. VPC

Creates:
```text
isolated AWS network
```

---

# 2. Multi-AZ Public Subnets

Creates:
- subnet in AZ-1
- subnet in AZ-2

This enables:
```text
high availability
```

---

# 3. Application Load Balancer (ALB)

Acts as:
```text
traffic distribution layer
```

Users access:
```text
ALB DNS
```

NOT EC2 directly.

---

# 4. Target Group

Acts as:
```text
backend EC2 group
```

Responsibilities:
- health checks
- traffic forwarding
- backend registration

---

# 5. Launch Template

Acts as:
```text
EC2 blueprint
```

Defines:
- AMI
- instance type
- Security Group
- user_data

---

# 6. Auto Scaling Group (ASG)

Acts as:
```text
self-healing infrastructure manager
```

Responsibilities:
- launch EC2s
- replace failed EC2s
- maintain desired capacity
- scale infrastructure

---

# 7. user_data

Automatically:
```text
bootstraps EC2 during launch
```

Installs:
- NGINX
- custom web page
- instance metadata

---

# Terraform Variables Used

---

# desired_capacity

Defines:
```text
normal EC2 count
```

---

# min_size

Defines:
```text
minimum EC2 count
```

---

# max_size

Defines:
```text
maximum scaling limit
```

---

# Example

```hcl
desired_capacity = 2
min_size         = 2
max_size         = 3
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
- DynamoDB state locking

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
- VPC
- ALB
- ASG
- Launch Template
- Target Group
- Security Groups

---

# userdata.sh

Automatically:
- installs nginx
- starts nginx
- creates custom web page
- displays instance ID

---

# outputs.tf

Displays:
- ALB DNS Name
- VPC ID
- subnet IDs
- ASG Name

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

# Step-3 — Format Terraform Files

```bash
terraform fmt
```

---

# Step-4 — Preview Infrastructure

```bash
terraform plan
```

Terraform shows creation of:
- ALB
- Target Group
- Launch Template
- ASG
- Multi-AZ infrastructure

---

# Step-5 — Deploy Infrastructure

```bash
terraform apply
```

Wait:
```text
2–5 minutes
```

because:
- ASG launches EC2s
- userdata installs nginx
- health checks stabilize

---

# Step-6 — Access Application

Terraform outputs:

```text
alb_dns_name
```

Open browser:

```text
http://<ALB-DNS-NAME>
```

---

# Expected Result

You should see:

```text
Project-14 ALB + ASG Infrastructure
```

AND:
```text
Instance ID
```

Refreshing browser multiple times should show:
```text
different EC2 instance IDs
```

This proves:
- ALB traffic distribution
- Target Group routing
- multiple EC2 instances
- load balancing

---

# Real-Time Traffic Flow

```text
User Browser
      ↓
ALB DNS
      ↓
ALB Listener
      ↓
Target Group
      ↓
Healthy EC2 Instances
      ↓
NGINX Response
```

---

# Security Architecture

---

# ALB Security Group

Allows:
```text
HTTP traffic from Internet
```

---

# EC2 Security Group

Allows:
```text
traffic ONLY from ALB
```

This is:
```text
production-grade security design
```

---

# Important Architectural Shift

Before Project-14:

```text
User → EC2
```

After Project-14:

```text
User → ALB → Target Group → ASG → EC2
```

This is REAL enterprise architecture.

---

# High Availability Concept

Infrastructure spans:
- multiple AZs
- multiple subnets
- multiple EC2s

If:
```text
one EC2 fails
```

ASG automatically:
```text
launches replacement EC2
```

Application remains available.

---

# Self-Healing Infrastructure

ASG continuously ensures:
```text
desired number of EC2 instances always running
```

This creates:
```text
resilient infrastructure
```

---

# IMDSv2 Learning

While implementing instance metadata retrieval, IMDSv2 authentication was required.

This introduced:
```text
AWS EC2 Metadata Security Model
```

Updated `userdata.sh` used:
- metadata token retrieval
- secure metadata access

---

# Important Enterprise Learning

Launch Template updates do NOT automatically replace running EC2 instances inside ASG.

ASG typically uses:
```text
latest template only for future launches
```

This is important realtime production behavior.

---

# Screenshots

---

# AWS Infrastructure Screenshots

Add screenshots for:
- VPC
- Subnets
- ALB
- Target Group
- ASG
- EC2 Instances

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
[ Add Terraform Output Screenshots Here ]
```

---

# ALB Verification

Add screenshot showing:
- ALB DNS
- webpage response

```text
[ Add ALB Browser Screenshot Here ]
```

---

# Instance ID Load Balancing Verification

Add screenshots showing:
- changing instance IDs after refresh

```text
[ Add Load Balancing Verification Screenshots Here ]
```

---

# Important Learning Outcomes

This project helps understand:
- ALB Architecture
- Auto Scaling
- Launch Templates
- Target Groups
- Multi-AZ Infrastructure
- High Availability
- Self-Healing Systems
- user_data Bootstrapping
- Production Traffic Flow
- Enterprise Cloud Architecture

---

# Biggest Conceptual Shift

Before:

```text
Infrastructure = Single Server
```

After:

```text
Infrastructure = Distributed Resilient Service
```

This is one of the biggest Terraform and AWS architecture learning milestones.

---

# Real-Time Enterprise Relevance

This architecture is widely used for:
- web applications
- APIs
- microservices
- enterprise platforms
- internal tools

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
- HTTPS with ACM
- Route53
- CloudFront
- Private Subnets
- NAT Gateway
- RDS
- EKS
- CI/CD Integration
- Monitoring & Logging

---