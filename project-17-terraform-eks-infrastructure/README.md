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
## S3 State File
<img width="1919" height="379" alt="Screenshot 2026-05-29 181618" src="https://github.com/user-attachments/assets/6a07aed3-3932-4553-b3a6-41d44c613dd8" />

## DynamoDB State Lock
<img width="1897" height="731" alt="Screenshot 2026-05-29 181631" src="https://github.com/user-attachments/assets/3362600c-0429-462d-b583-d6ba51c25054" />

---

# EKS Infrastructure
## Terraform Apply
<img width="1199" height="195" alt="Screenshot 2026-05-29 172444" src="https://github.com/user-attachments/assets/67c5da08-9f6d-42d5-a81a-614ea1acb059" />

## VPC - Resource Map
<img width="1919" height="760" alt="Screenshot 2026-05-29 172703" src="https://github.com/user-attachments/assets/e31771ae-4ad2-42dd-8c13-e6677e7855e4" />

## IAM Roles
<img width="1890" height="360" alt="Screenshot 2026-05-29 172856" src="https://github.com/user-attachments/assets/83d116ed-2f47-4b14-abf5-d0970902cba6" />
<img width="1919" height="681" alt="Screenshot 2026-05-29 183232" src="https://github.com/user-attachments/assets/7ef5704c-b83f-49c4-8929-7a49da65ab69" />

## EKS Cluster
<img width="1914" height="262" alt="Screenshot 2026-05-29 172948" src="https://github.com/user-attachments/assets/618c15c3-b9bb-4726-b34b-7c96b84a8107" />

## EKS Node Group
<img width="1919" height="737" alt="Screenshot 2026-05-29 173958" src="https://github.com/user-attachments/assets/823d5c4f-f2fa-41eb-a917-aa7873c8841d" />

# Worker Nodes
<img width="1919" height="292" alt="Screenshot 2026-05-29 173137" src="https://github.com/user-attachments/assets/5e406a25-17f3-419f-8085-88d2b5f1fb7d" />

## kubectl get nodes
<img width="1256" height="170" alt="Screenshot 2026-05-29 173633" src="https://github.com/user-attachments/assets/7cb478cb-2706-4905-ab8f-e698f15c1eec" />

## NGINX Deployment
 - kubectl get deployments
 - kubectl get pods
<img width="1404" height="317" alt="Screenshot 2026-05-29 180650" src="https://github.com/user-attachments/assets/df497307-c9d6-4624-a8fc-ed1c10dd3b61" />

## kubectl get pods -o wide
<img width="1789" height="108" alt="Screenshot 2026-05-29 180816" src="https://github.com/user-attachments/assets/02a5dea8-bcfa-4b86-affe-acea9ca020b5" />

## kubectl get services
<img width="1813" height="161" alt="Screenshot 2026-05-29 181028" src="https://github.com/user-attachments/assets/6f376c77-60aa-49cc-8859-e292392de23a" />

## AWS Load Balancer
<img width="1670" height="208" alt="Screenshot 2026-05-29 181306" src="https://github.com/user-attachments/assets/be2ae02a-6f8a-4dc4-8de3-e6c5036cdd27" />
<img width="1913" height="370" alt="Screenshot 2026-05-29 181823" src="https://github.com/user-attachments/assets/1fa39276-26b1-4683-a4b0-9c949c4b11e9" />

## Browser Output
<img width="1373" height="591" alt="Screenshot 2026-05-29 181130" src="https://github.com/user-attachments/assets/e71f82df-3be2-4eeb-b743-5be52798eec7" />

## kubectl get all
<img width="1777" height="368" alt="Screenshot 2026-05-29 181203" src="https://github.com/user-attachments/assets/5ca01c56-f9e0-4c18-bb6d-b9a83d397a9a" />

## kubectl describe deployment nginx-deployment.yaml
<img width="1349" height="859" alt="Screenshot 2026-05-29 182009" src="https://github.com/user-attachments/assets/263a08cc-4d8c-4ef3-806d-55ecaf36c6a4" />

## kubectl describe service nginx-service.yaml
<img width="1817" height="657" alt="Screenshot 2026-05-29 182020" src="https://github.com/user-attachments/assets/ae89ba45-497c-4b07-864d-2e05abc262ef" />

## Architecture Reference
<img width="1536" height="1024" alt="Terraform Provisioned AWS EKS" src="https://github.com/user-attachments/assets/09227ecc-9c02-41ba-a36c-4b208f2af177" />

---


