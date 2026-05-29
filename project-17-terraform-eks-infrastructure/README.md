# Project-17: Terraform Provisioned Amazon EKS Infrastructure

## Overview

This project demonstrates how to provision a production-style Amazon EKS (Elastic Kubernetes Service) platform using Terraform.

The infrastructure includes networking, IAM roles, EKS cluster creation, managed node groups, Kubernetes deployments, Kubernetes services, and AWS Load Balancer integration.

The project follows Infrastructure as Code (IaC) principles and uses Terraform remote state management with Amazon S3 and DynamoDB.

---

# Architecture

```text
Internet
    │
    ▼
AWS Load Balancer
    │
    ▼
Kubernetes Service
    │
    ▼
NGINX Pods
    │
    ▼
EKS Worker Nodes
    │
    ▼
Amazon EKS Cluster
    │
    ▼
Terraform Provisioned Infrastructure
```

---

# Objectives

* Provision Amazon EKS using Terraform
* Implement remote state management
* Build production-style VPC networking
* Create managed Kubernetes worker nodes
* Deploy containerized applications
* Expose applications through AWS Load Balancer
* Understand Kubernetes architecture and workflows

---

# AWS Services Used

| Service               | Purpose                                 |
| --------------------- | --------------------------------------- |
| VPC                   | Isolated network environment            |
| Public Subnets        | Load Balancer and NAT Gateway           |
| Private Subnets       | EKS Worker Nodes                        |
| Internet Gateway      | Internet access                         |
| NAT Gateway           | Outbound internet for private resources |
| Route Tables          | Traffic routing                         |
| IAM Roles             | EKS permissions                         |
| Amazon EKS            | Managed Kubernetes Control Plane        |
| Managed Node Group    | Kubernetes Worker Nodes                 |
| EC2                   | Worker Node Instances                   |
| Elastic Load Balancer | Application access                      |
| S3                    | Terraform Remote State                  |
| DynamoDB              | Terraform State Locking                 |

---

# Infrastructure Components

## Networking

* VPC
* Public Subnet 1
* Public Subnet 2
* Private Subnet 1
* Private Subnet 2
* Internet Gateway
* NAT Gateway
* Public Route Table
* Private Route Table

## Security & IAM

* EKS Cluster IAM Role
* Node Group IAM Role
* IAM Policy Attachments

## Kubernetes Platform

* Amazon EKS Cluster
* Managed Node Group
* Worker Nodes

## Workloads

* NGINX Deployment
* Kubernetes Service
* AWS Load Balancer

---

# Project Structure

```text
project-17-terraform-eks-infrastructure/
│
├── provider.tf
├── backend.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
├── README.md
├── .gitignore
│
├── kubernetes/
│   ├── nginx-deployment.yaml
│   └── nginx-service.yaml
│
└── screenshots/
```

---

# Terraform Backend

Remote backend configuration:

* Amazon S3 for state storage
* DynamoDB for state locking

Benefits:

* Centralized state management
* Team collaboration
* State locking protection
* Improved reliability

---

# Kubernetes Deployment

## Deployment

NGINX application deployed using:

```yaml
kind: Deployment
```

Features:

* 2 replicas
* Automatic scheduling
* Self-healing pods

---

## Service

NGINX exposed using:

```yaml
kind: Service
type: LoadBalancer
```

Features:

* Automatic AWS Load Balancer creation
* External access
* Traffic distribution

---

# Terraform Workflow

## Initialize Terraform

```bash
terraform init
```

## Validate Configuration

```bash
terraform validate
```

## Format Configuration

```bash
terraform fmt
```

## Preview Changes

```bash
terraform plan
```

## Deploy Infrastructure

```bash
terraform apply
```

---

# Kubernetes Workflow

## Configure kubectl

```bash
aws eks update-kubeconfig \
--region ap-south-1 \
--name project-17-eks-cluster
```

## Verify Nodes

```bash
kubectl get nodes
```

## Deploy Application

```bash
kubectl apply -f kubernetes/nginx-deployment.yaml
```

## Verify Pods

```bash
kubectl get pods
```

## Create Service

```bash
kubectl apply -f kubernetes/nginx-service.yaml
```

## Verify Service

```bash
kubectl get services
```

---

# Verification Commands

```bash
kubectl get nodes
```

```bash
kubectl get deployments
```

```bash
kubectl get pods
```

```bash
kubectl get pods -o wide
```

```bash
kubectl get services
```

```bash
kubectl get all
```

```bash
kubectl describe deployment nginx-deployment
```

```bash
kubectl describe service nginx-service
```

---

# Key Learning Outcomes

This project helped understand:

* Terraform Infrastructure as Code
* Remote State Management
* Amazon EKS Architecture
* Kubernetes Control Plane
* Managed Node Groups
* Worker Nodes
* Deployments
* Pods
* Services
* AWS Load Balancer Integration
* Kubernetes Networking
* Multi-AZ Infrastructure Design

---

# Real-World Use Cases

This architecture pattern is commonly used for:

* Enterprise Applications
* Microservices Platforms
* Internal Business Applications
* Containerized Workloads
* Cloud-Native Platforms
* DevOps and Platform Engineering Environments

---

# Screenshots

## Terraform Backend

*Add screenshots here*

## Terraform Apply

*Add screenshots here*

## S3 State File

*Add screenshots here*

## DynamoDB State Lock

*Add screenshots here*

## VPC

*Add screenshots here*

## Public Subnets

*Add screenshots here*

## Private Subnets

*Add screenshots here*

## Internet Gateway

*Add screenshots here*

## NAT Gateway

*Add screenshots here*

## Route Tables

*Add screenshots here*

## IAM Roles

*Add screenshots here*

## EKS Cluster

*Add screenshots here*

## EKS Node Group

*Add screenshots here*

## Worker Nodes

*Add screenshots here*

## kubectl get nodes

*Add screenshots here*

## NGINX Deployment

*Add screenshots here*

## kubectl get deployments

*Add screenshots here*

## kubectl get pods

*Add screenshots here*

## kubectl get pods -o wide

*Add screenshots here*

## kubectl get services

*Add screenshots here*

## AWS Load Balancer

*Add screenshots here*

## Browser Output

*Add screenshots here*

## kubectl get all

*Add screenshots here*

## Terraform Destroy

*Add screenshots here*

---


