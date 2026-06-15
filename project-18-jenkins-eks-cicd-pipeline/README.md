# Project 18 - End-to-End CI/CD Pipeline on AWS using Terraform, Jenkins, Docker, ECR & EKS

## Overview

This project demonstrates the implementation of a complete CI/CD pipeline on AWS using Infrastructure as Code (Terraform), containerization (Docker), Kubernetes (Amazon EKS), container registry (Amazon ECR), Jenkins, and GitHub.

The objective was to automate infrastructure provisioning, application deployment, and delivery workflows while following DevOps best practices.

---

## Architecture

```text
Developer
    │
    ▼
 GitHub Repository
    │
    ▼
 GitHub Webhook
    │
    ▼
 Jenkins Pipeline
    │
    ├── Build Docker Images
    ├── Authenticate to AWS
    ├── Push Images to ECR
    └── Deploy to EKS
    │
    ▼
 Amazon ECR
    │
    ▼
 Amazon EKS
    │
    ├── Frontend Pods
    └── Backend Pods
    │
    ▼
 AWS Load Balancer
    │
    ▼
 Application Access
```

---

## Technologies Used

### Cloud

* AWS EC2
* AWS VPC
* AWS IAM
* Amazon EKS
* Amazon ECR
* Amazon S3
* Amazon DynamoDB

### DevOps

* Terraform
* Jenkins
* GitHub
* Docker
* Kubernetes
* kubectl

### Operating System

* Linux (Ubuntu)

---

## Project Structure

```text
project-18-jenkins-eks-cicd-pipeline/

├── backend/
│   ├── Dockerfile
│   └── application files
│
├── frontend/
│   ├── Dockerfile
│   └── application files
│
├── kubernetes/
│   ├── frontend-deployment.yaml
│   ├── frontend-service.yaml
│   ├── backend-deployment.yaml
│   └── backend-service.yaml
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── provider.tf
│
├── Jenkinsfile
│
└── README.md
```

---

## Infrastructure Provisioned using Terraform

* VPC
* Public Subnets
* Private Subnets
* Internet Gateway
* NAT Gateway
* Route Tables
* EKS Cluster
* Managed Node Group
* IAM Roles
* Amazon ECR Repositories
* Jenkins EC2 Instance

---

## CI/CD Workflow

### Continuous Integration

1. Developer pushes code to GitHub.
2. GitHub webhook triggers Jenkins.
3. Jenkins checks out the latest code.
4. Docker images are built for frontend and backend.
5. Jenkins authenticates with AWS.
6. Images are pushed to Amazon ECR.

### Continuous Deployment

7. Jenkins connects to Amazon EKS.
8. Kubernetes deployments are updated.
9. New containers are deployed to the cluster.
10. Application becomes available through AWS Load Balancer.

---

## Jenkins Pipeline Stages

* Checkout Source Code
* Build Frontend Image
* Build Backend Image
* Login to Amazon ECR
* Push Frontend Image
* Push Backend Image
* Deploy to Amazon EKS
* Verify Deployment

---

## Validation Commands

### Verify EKS Cluster

```bash
aws eks list-clusters --region ap-south-1
kubectl get nodes
```

### Verify Pods

```bash
kubectl get pods
```

### Verify Services

```bash
kubectl get svc
```

### Verify Deployments

```bash
kubectl get deployments
```

---

## Key Learnings

* Infrastructure as Code using Terraform
* AWS networking fundamentals
* Kubernetes deployment management
* Amazon EKS administration
* Amazon ECR image management
* Jenkins pipeline development
* GitHub webhook automation
* IAM and RBAC configuration
* CI/CD implementation on AWS

---

## Challenges Solved

During implementation, several real-world issues were identified and resolved:

* Terraform state management
* IAM permission issues
* EKS authentication problems
* Kubernetes RBAC configuration
* Jenkins installation challenges
* Docker permission issues
* GitHub webhook integration
* Disk space and build failures
* ECR authentication troubleshooting

---

## Future Enhancements

* AWS Load Balancer Controller
* Kubernetes Ingress
* Route53 Custom Domain
* SSL/TLS using AWS Certificate Manager
* Monitoring with Prometheus & Grafana
* Logging with ELK Stack
* Blue/Green Deployments
* Automated Rollbacks
* Multi-Environment Deployments (Dev, QA, Prod)

---

## Outcome

Successfully implemented an end-to-end DevOps platform that automates infrastructure provisioning, container image management, Kubernetes deployments, and CI/CD workflows on AWS using Terraform, Jenkins, Docker, Amazon ECR, and Amazon EKS.

# Project 18 - End-to-End CI/CD Pipeline on AWS using Terraform, Jenkins, Docker, ECR & EKS

## Overview

This project demonstrates the implementation of a complete CI/CD pipeline on AWS using Infrastructure as Code (Terraform), containerization (Docker), Kubernetes (Amazon EKS), container registry (Amazon ECR), Jenkins, and GitHub.

The objective was to automate infrastructure provisioning, application deployment, and delivery workflows while following DevOps best practices.

---

## Architecture

```text
Developer
    │
    ▼
 GitHub Repository
    │
    ▼
 GitHub Webhook
    │
    ▼
 Jenkins Pipeline
    │
    ├── Build Docker Images
    ├── Authenticate to AWS
    ├── Push Images to ECR
    └── Deploy to EKS
    │
    ▼
 Amazon ECR
    │
    ▼
 Amazon EKS
    │
    ├── Frontend Pods
    └── Backend Pods
    │
    ▼
 AWS Load Balancer
    │
    ▼
 Application Access
```

---

## Technologies Used

### Cloud

* AWS EC2
* AWS VPC
* AWS IAM
* Amazon EKS
* Amazon ECR
* Amazon S3
* Amazon DynamoDB

### DevOps

* Terraform
* Jenkins
* GitHub
* Docker
* Kubernetes
* kubectl

### Operating System

* Linux (Ubuntu)

---

## Project Structure

```text
project-18-jenkins-eks-cicd-pipeline/

├── backend/
│   ├── Dockerfile
│   └── application files
│
├── frontend/
│   ├── Dockerfile
│   └── application files
│
├── kubernetes/
│   ├── frontend-deployment.yaml
│   ├── frontend-service.yaml
│   ├── backend-deployment.yaml
│   └── backend-service.yaml
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── provider.tf
│
├── Jenkinsfile
│
└── README.md
```

---

## Infrastructure Provisioned using Terraform

* VPC
* Public Subnets
* Private Subnets
* Internet Gateway
* NAT Gateway
* Route Tables
* EKS Cluster
* Managed Node Group
* IAM Roles
* Amazon ECR Repositories
* Jenkins EC2 Instance

---

## CI/CD Workflow

### Continuous Integration

1. Developer pushes code to GitHub.
2. GitHub webhook triggers Jenkins.
3. Jenkins checks out the latest code.
4. Docker images are built for frontend and backend.
5. Jenkins authenticates with AWS.
6. Images are pushed to Amazon ECR.

### Continuous Deployment

7. Jenkins connects to Amazon EKS.
8. Kubernetes deployments are updated.
9. New containers are deployed to the cluster.
10. Application becomes available through AWS Load Balancer.

---

## Jenkins Pipeline Stages

* Checkout Source Code
* Build Frontend Image
* Build Backend Image
* Login to Amazon ECR
* Push Frontend Image
* Push Backend Image
* Deploy to Amazon EKS
* Verify Deployment

---

## Validation Commands

### Verify EKS Cluster

```bash
aws eks list-clusters --region ap-south-1
kubectl get nodes
```

### Verify Pods

```bash
kubectl get pods
```

### Verify Services

```bash
kubectl get svc
```

### Verify Deployments

```bash
kubectl get deployments
```

---

## Screenshots



## Key Learnings

* Infrastructure as Code using Terraform
* AWS networking fundamentals
* Kubernetes deployment management
* Amazon EKS administration
* Amazon ECR image management
* Jenkins pipeline development
* GitHub webhook automation
* IAM and RBAC configuration
* CI/CD implementation on AWS

---

## Challenges Solved

During implementation, several real-world issues were identified and resolved:

* Terraform state management
* IAM permission issues
* EKS authentication problems
* Kubernetes RBAC configuration
* Jenkins installation challenges
* Docker permission issues
* GitHub webhook integration
* Disk space and build failures
* ECR authentication troubleshooting

---

## Future Enhancements

* AWS Load Balancer Controller
* Kubernetes Ingress
* Route53 Custom Domain
* SSL/TLS using AWS Certificate Manager
* Monitoring with Prometheus & Grafana
* Logging with ELK Stack
* Blue/Green Deployments
* Automated Rollbacks
* Multi-Environment Deployments (Dev, QA, Prod)

---

## Outcome

Successfully implemented an end-to-end DevOps platform that automates infrastructure provisioning, container image management, Kubernetes deployments, and CI/CD workflows on AWS using Terraform, Jenkins, Docker, Amazon ECR, and Amazon EKS.

<img width="1536" height="1024" alt="End to End CI-CD pipeline on AWS" src="https://github.com/user-attachments/assets/1475b17b-6799-4dad-abc7-13725d6dfc96" />
