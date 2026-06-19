# Project-19 — Enterprise AWS EKS Platform using Terraform

## Overview

This project demonstrates how enterprise organizations design, provision, and manage Kubernetes infrastructure on AWS using Terraform, reusable modules, environment isolation, and Infrastructure as Code (IaC) best practices.

Unlike simple Terraform projects that deploy resources from a single codebase and shared state file, this project implements a production-style architecture using reusable modules, dedicated environment configurations, independent state management, and scalable infrastructure design.

The objective is to build a scalable, maintainable, and enterprise-ready Amazon EKS platform that supports multiple environments while promoting code reuse and operational safety.

---

## Project Objectives

* Design enterprise-grade Terraform architecture
* Build reusable Terraform modules
* Implement Dev, QA, and Production environments
* Create Amazon EKS infrastructure using Terraform
* Manage independent Terraform state per environment
* Follow Infrastructure as Code (IaC) best practices
* Learn real-world cloud platform engineering patterns
* Understand how large organizations structure Terraform repositories

---

## Enterprise Architecture

```text
                     GitHub Repository
                              │
                              ▼
                     Terraform Code
                              │
                              ▼

       ┌─────────────────────────────────────────┐
       │            Environments                 │
       └─────────────────────────────────────────┘

          Dev              QA             Prod

           │                │               │

           ▼                ▼               ▼

      Dev State       QA State       Prod State

           │                │               │

           ▼                ▼               ▼

      AWS EKS         AWS EKS        AWS EKS
```

---

## AWS Infrastructure Architecture

```text
                           Internet
                               │
                               ▼
                      Internet Gateway
                               │
                               ▼
                     Amazon VPC (Multi-AZ)
                               │
        ┌──────────────────────┼──────────────────────┐
        │                                             │
        ▼                                             ▼

 Public Subnet A                              Public Subnet B

        │
        ▼

   NAT Gateway

        │
        ▼

 Private Subnet A                             Private Subnet B

        │                                             │
        └──────────────────────┬──────────────────────┘
                               │
                               ▼

                     Amazon EKS Cluster

                               │

                     Managed Node Group

                               │

                          Kubernetes Pods
```

---

## Repository Structure

```text
terraform/

├── modules/
│
│   ├── vpc/
│   ├── security-group/
│   ├── iam/
│   ├── eks/
│   └── node-group/
│
├── environments/
│
│   ├── dev/
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   └── outputs.tf
│
│   ├── qa/
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   └── outputs.tf
│
│   └── prod/
│       ├── backend.tf
│       ├── main.tf
│       ├── variables.tf
│       ├── terraform.tfvars
│       └── outputs.tf
│
└── README.md
```

---

## Core Design Principles

### Reusable Modules

Infrastructure components are built once and reused across multiple environments.

Modules implemented:

* VPC Module
* Security Group Module
* IAM Module
* EKS Module
* Node Group Module

Benefits:

* Reduced duplication
* Easier maintenance
* Consistent deployments
* Faster provisioning

---

### Environment Isolation

Each environment maintains:

* Independent Terraform state
* Independent backend configuration
* Independent variables
* Independent deployment lifecycle

Example:

```text
Dev  → dev/terraform.tfstate

QA   → qa/terraform.tfstate

Prod → prod/terraform.tfstate
```

This prevents accidental modifications across environments.

---

### Remote State Management

Terraform state is stored remotely using:

* Amazon S3
* DynamoDB State Locking

Benefits:

* Team collaboration
* State consistency
* Disaster recovery
* Concurrent operation protection

Architecture:

```text
Terraform
    │
    ├── S3 Bucket
    │      └── terraform.tfstate
    │
    └── DynamoDB
           └── State Lock
```

---

## Terraform Module Dependency Flow

The project follows a modular design where each module has a single responsibility.

```text
VPC Module
     │
     ▼
Security Group Module
     │
     ▼
IAM Module
     │
     ▼
EKS Module
     │
     ▼
Node Group Module
```

---

## Module Communication

Terraform modules communicate through outputs and variables.

Example:

### VPC Module Output

```hcl
output "private_subnet_ids" {
  value = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]
}
```

### EKS Module Consumption

```hcl
private_subnet_ids = module.vpc.private_subnet_ids
```

Benefits:

* Loose coupling
* Reusability
* Easier maintenance
* Better scalability

---

## Amazon EKS Platform

### Control Plane

The EKS module provisions:

* Amazon EKS Cluster
* Kubernetes API Endpoint
* IAM Integration
* Cluster Networking

### Worker Layer

The Node Group module provisions:

* Managed Node Groups
* Auto Scaling Configuration
* EC2 Worker Nodes

### Networking Layer

The VPC module provisions:

* VPC
* Public Subnets
* Private Subnets
* Internet Gateway
* NAT Gateway
* Route Tables
* Route Associations

### Security Layer

The Security and IAM modules provision:

* Security Groups
* IAM Roles
* IAM Policies
* EKS Permissions

---

## Environment Strategy

### Development Environment

Purpose:

* Learning
* Testing
* Development

Typical Configuration:

* Smaller instance types
* Lower node count

### QA Environment

Purpose:

* Integration testing
* Validation
* Functional testing

Typical Configuration:

* Medium-sized infrastructure

### Production Environment

Purpose:

* Live workloads
* Production traffic

Typical Configuration:

* Larger node groups
* Higher availability
* Additional security controls

---

## Terraform Validation Workflow

### Format Terraform Code

```bash
terraform fmt -recursive
```

### Validate Configuration

```bash
terraform validate
```

### Generate Execution Plan

```bash
terraform plan
```

### Deploy Infrastructure

```bash
terraform apply
```

### Destroy Infrastructure

```bash
terraform destroy
```

---

## Current Implementation Status

### Networking

* VPC
* Public Subnets
* Private Subnets
* Internet Gateway
* NAT Gateway
* Route Tables
* Route Associations

### Security

* Security Groups
* IAM Roles
* IAM Policy Attachments

### Kubernetes

* Amazon EKS Cluster
* Managed Node Groups

### Environment Management

* Dev Environment
* QA Environment
* Production Environment

### State Management

* S3 Remote State
* DynamoDB State Locking

---

## Enterprise Benefits

This architecture provides:

* Environment Isolation
* Infrastructure Reusability
* Reduced Operational Risk
* Simplified Maintenance
* Scalability
* Team Collaboration
* Production Readiness

---

## Key Terraform Concepts Covered

* Providers
* Variables
* Outputs
* Modules
* Remote State
* State Locking
* Backend Configuration
* Dependency Management
* Multi-Environment Architecture
* Infrastructure Reusability

---

## Learning Outcomes

By completing this project, you will understand:

* How enterprise teams structure Terraform repositories
* How reusable modules are designed and consumed
* How Dev, QA, and Prod environments are isolated
* How Terraform state is managed at scale
* How Amazon EKS platforms are provisioned and operated
* How Infrastructure as Code is implemented in real-world organizations
* How Terraform modules communicate through outputs and variables

---

## Recommended Screenshots

### Repository Structure

* Terraform Folder Structure
* Modules Layout
* Environment Layout

### AWS Networking

* VPC Dashboard
* Public Subnets
* Private Subnets
* Route Tables
* Internet Gateway
* NAT Gateway

### EKS

* EKS Cluster Overview
* Node Group Overview
* Worker Nodes
* kubectl get nodes

### Terraform

* terraform plan
* terraform apply
* S3 State File
* DynamoDB Lock Table

---

## Project Screenshots

### Repository Structure

![Repository Structure](screenshots/repository-structure.png)

### AWS VPC Architecture

![VPC Architecture](screenshots/vpc.png)

### EKS Cluster

![EKS Cluster](screenshots/eks-cluster.png)

### Node Groups

![Node Group](screenshots/node-group.png)

### Terraform Apply

![Terraform Apply](screenshots/terraform-apply.png)

---

## Interview Discussion Topics

### Terraform

* Modules
* Variables
* Outputs
* Remote State
* State Locking
* Dependency Management

### AWS Networking

* CIDR Planning
* Public vs Private Subnets
* Route Tables
* Internet Gateway
* NAT Gateway
* Multi-AZ Architecture

### Amazon EKS

* EKS Control Plane
* Managed Node Groups
* IAM Roles
* Kubernetes Networking

### DevOps Practices

* Infrastructure as Code
* Environment Isolation
* Reusable Infrastructure
* Enterprise Repository Design

---

## Common Interview Questions

1. Why use Terraform Modules?
2. Difference between Root Modules and Child Modules?
3. Why store Terraform state remotely?
4. Why use DynamoDB with Terraform?
5. Why deploy EKS worker nodes in private subnets?
6. Difference between Internet Gateway and NAT Gateway?
7. How do Terraform modules communicate?
8. How do you manage multiple environments?
9. What are Terraform Outputs?
10. How does Terraform State Locking work?
11. What resources are required for EKS?
12. How do Managed Node Groups work?

---

## Real-World Considerations

### Production Improvements

* One NAT Gateway per Availability Zone
* Private EKS API Endpoint
* AWS Secrets Manager Integration
* KMS Encryption
* Centralized Logging
* Monitoring and Alerting
* Cost Optimization Policies

### CI/CD Enhancements

* GitHub Actions
* Jenkins Pipelines
* Approval Gates
* Automated Terraform Plan Reviews
* Drift Detection

---

## Future Enhancements

* AWS Load Balancer Controller
* ExternalDNS
* Route53 Integration
* ArgoCD GitOps
* Prometheus & Grafana
* OpenSearch / ELK Stack
* Blue-Green Deployments
* Multi-Account AWS Architecture
* Security Scanning
* Policy as Code

---

```

**One suggestion:** since this is a Terraform-only project right now, remove all references to "CI/CD Pipeline" from the top architecture diagram until you actually add GitHub Actions or Jenkins in a future project. That keeps the README technically accurate during interviews.
```
