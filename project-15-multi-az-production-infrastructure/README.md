# Project-15 — Terraform Multi-AZ Production Infrastructure

This project demonstrates how to build a production-style AWS infrastructure using Terraform with:

- Public Subnets
- Private Subnets
- NAT Gateway
- Application Load Balancer (ALB)
- Auto Scaling Group (ASG)
- Multi-AZ Deployment
- Private EC2 Infrastructure

This project represents a major architectural shift from:

```text
public infrastructure
```

to:

```text
secure production-grade private infrastructure
```

---

# Project Objective

The objective of this project is to:

- Understand public vs private infrastructure
- Learn Multi-AZ networking architecture
- Deploy private EC2 instances
- Implement NAT Gateway architecture
- Build highly available infrastructure
- Understand enterprise traffic flow
- Learn production-grade AWS networking
- Automate scalable infrastructure using Terraform

---

# Real-Time Problem Statement

In beginner cloud architectures:

```text
Internet → EC2 directly
```

Problems:
- security risks
- direct server exposure
- weak architecture
- poor scalability
- not production-ready

In real enterprises:
- application servers remain private
- users never directly access EC2
- traffic flows through Load Balancer
- infrastructure spans multiple AZs

This project solves these challenges.

---

# Solution Architecture

This project creates:

```text
Internet
   ↓
Application Load Balancer
   ↓
Private EC2 Instances
```

Private EC2 instances:
- do NOT have public IPs
- remain inside private subnets
- use NAT Gateway for outbound internet access

This is REAL production architecture.

---

# Complete Architecture Diagram

```text
                    Internet
                        │
                        ▼
                 Internet Gateway
                        │
                        ▼
               Application Load Balancer
                        │
         ┌──────────────┴──────────────┐
         ▼                             ▼

   Public Subnet AZ-1           Public Subnet AZ-2
         │                             │
         ▼                             ▼

   Private App Subnet           Private App Subnet
         │                             │
         └──────────────┬──────────────┘
                        ▼

               EC2 Application Servers
                        │
                        ▼

                  NAT Gateway
                        │
                        ▼

                    Internet
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
Create Private Subnets
      ↓
Create Internet Gateway
      ↓
Create Elastic IP
      ↓
Create NAT Gateway
      ↓
Create Route Tables
      ↓
Create Security Groups
      ↓
Create Launch Template
      ↓
Create Target Group
      ↓
Create ALB
      ↓
Create ALB Listener
      ↓
Create Auto Scaling Group
      ↓
ASG launches Private EC2 Instances
      ↓
userdata.sh installs NGINX
      ↓
ALB routes traffic to healthy private EC2s
```

---

# Technologies Used

- Terraform
- AWS VPC
- AWS EC2
- AWS ALB
- AWS Auto Scaling Group
- AWS NAT Gateway
- AWS Route Tables
- AWS Internet Gateway
- AWS Security Groups
- AWS Launch Templates
- AWS S3 Backend
- AWS DynamoDB
- NGINX
- Git & GitHub
- VS Code

---

# Key AWS Components

---

# 1. VPC

Creates isolated AWS network:

```text
10.0.0.0/16
```

---

# 2. Public Subnets

Used for:
- ALB
- NAT Gateway

Publicly accessible.

---

# 3. Private Subnets

Used for:
- application EC2 instances

Important:
```text
NO public IPs
```

This is the biggest production concept.

---

# 4. Internet Gateway

Allows:
```text
internet access for public infrastructure
```

Used by:
- ALB
- NAT Gateway

---

# 5. Elastic IP

Required for:
```text
NAT Gateway
```

Provides static public IP.

---

# 6. NAT Gateway

Allows:

```text
Private EC2 → Outbound Internet
```

Example:
- yum update
- package installation
- internet downloads

WITHOUT exposing EC2 publicly.

---

# 7. Public Route Table

Routes:

```text
0.0.0.0/0 → Internet Gateway
```

Attached to:
- public subnets

---

# 8. Private Route Table

Routes:

```text
0.0.0.0/0 → NAT Gateway
```

Attached to:
- private subnets

---

# 9. ALB Security Group

Allows:
- HTTP traffic from internet

---

# 10. EC2 Security Group

Allows:
- traffic ONLY from ALB
- SSH access

This creates secure architecture.

---

# 11. Launch Template

Acts as:

```text
EC2 blueprint
```

Defines:
- AMI
- instance type
- userdata
- security groups

---

# 12. Auto Scaling Group (ASG)

Automatically:
- launches EC2s
- maintains desired capacity
- replaces failed EC2s

Creates:
```text
self-healing infrastructure
```

---

# 13. Target Group

Handles:
- EC2 registration
- health checks
- backend traffic routing

---

# 14. Application Load Balancer (ALB)

Acts as:
```text
public entry point
```

Distributes traffic across:
- multiple EC2s
- multiple AZs

---

# 15. userdata.sh

Automatically:
- installs nginx
- starts nginx
- creates custom webpage
- displays instance ID

---

# Project Structure

```text
project-15-multi-az-production-infrastructure/
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

Wait:
```text
5–8 minutes
```

because:
- NAT Gateway provisioning takes time
- ASG launches EC2 instances
- userdata installs nginx
- health checks stabilize

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
Project-15 Multi-AZ Production Infrastructure
```

AND:
```text
Instance ID
```

Refreshing browser multiple times should display:
```text
different EC2 instance IDs
```

This proves:
- ALB working
- load balancing working
- multiple EC2 instances active
- Target Group healthy

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
Private EC2 Instances
      ↓
NGINX Response
```

---

# Most Important Architectural Shift

Before:

```text
Internet → EC2 directly
```

After:

```text
Internet → ALB → Private EC2
```

This is the CORE learning outcome of Project-15.

---

# Important Production Concepts Learned

---

# Public Infrastructure

Contains:
- ALB
- NAT Gateway

Accessible from internet.

---

# Private Infrastructure

Contains:
- application servers

NOT directly accessible from internet.

---

# High Availability

Infrastructure spans:
- multiple Availability Zones
- multiple subnets
- multiple EC2 instances

This creates:
```text
fault-tolerant architecture
```

---

# Self-Healing Infrastructure

ASG automatically:
- replaces failed EC2s
- maintains desired instance count

---

# NAT Gateway Understanding

Private EC2 instances need:
- package downloads
- internet updates
- outbound internet access

NAT Gateway solves this securely.

Flow:

```text
Private EC2
    ↓
NAT Gateway
    ↓
Internet
```

But:
```text
Internet cannot directly reach private EC2
```

Very important production security concept.

---

# Verification Checklist

Successful implementation means:

✅ ALB accessible  
✅ Instance ID visible  
✅ Different instance IDs after refresh  
✅ EC2 instances have NO public IPs  
✅ NAT Gateway available  
✅ Target Group healthy  
✅ ASG healthy  
✅ Multi-AZ deployment active  

---

# AWS Console Verification

---

# Check ALB

Verify:
- DNS name working
- webpage accessible

---

# Check EC2

Verify:
```text
NO Public IPv4 Address
```

This is the MOST important validation.

---

# Check NAT Gateway

Verify:
- status = Available

---

# Check Target Group

Verify:
```text
Targets = Healthy
```

---

# Check ASG

Verify:
- Desired Capacity = 2
- Healthy Instances = 2

---

# Check Multi-AZ Placement

Verify:
- one EC2 in ap-south-1a
- one EC2 in ap-south-1b

---

# Screenshots

---

# AWS Infrastructure Screenshots

Add screenshots for:
- VPC
- Public Subnets
- Private Subnets
- NAT Gateway
- ALB
- ASG
- Target Group
- EC2 Instances

```text
[ Add AWS Console Screenshots Here ]
```

---

# Terraform Console Output

Add screenshots for:
- terraform init
- terraform validate
- terraform plan
- terraform apply

```text
[ Add Terraform Output Screenshots Here ]
```

---

# ALB Verification

Add screenshots showing:
- webpage
- instance ID

```text
[ Add ALB Browser Screenshots Here ]
```

---

# Load Balancing Verification

Add screenshots showing:
- changing instance IDs after refresh

```text
[ Add Load Balancing Verification Screenshots Here ]
```

---

# Important Learning Outcomes

This project teaches:
- public vs private networking
- production AWS architecture
- NAT Gateway concepts
- Multi-AZ infrastructure
- high availability
- load balancing
- Auto Scaling
- self-healing infrastructure
- enterprise traffic flow
- secure cloud design

---

# Biggest Learning

Infrastructure evolved from:

```text
public single-server deployment
```

to:

```text
secure scalable production platform
```

This is one of the most important AWS architecture milestones.

---

# Real Enterprise Relevance

This architecture pattern is widely used for:
- enterprise web applications
- APIs
- microservices
- Kubernetes platforms
- internal applications

---

# Best Practices

Never commit:
- `.terraform`
- `.tfstate`
- `.pem`
- secrets
- provider binaries

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
- Bastion Host
- Private ALB
- HTTPS with ACM
- Route53
- RDS
- EKS
- CI/CD Integration
- Monitoring Stack
- WAF
- CloudFront

---