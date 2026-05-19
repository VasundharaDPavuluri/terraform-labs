# Flow in Local Setup -- PC
Laptop --> Terraform + AWS CLI --> AWS Authentication --> Terraform Commands --> AWS Infrastructure Created

---

## Pre-requisites: Required installations in PC.
- Install Git
- Install Terraform
- Install AWS CLI

---
# Implementation - Infra Provisioning:
## Step 1 — Create Terraform Files
Example:
- provider.tf
- ec2.tf
- README.md 
________________________________________
## Step 2 — Create IAM User in AWS
We need AWS credentials so Terraform can authenticate.

Go to AWS Console
→ IAM → Users → Create User

Example:
```bash
terraform-user
```
Attach policy:

AdministratorAccess
(for learning only)
________________________________________
## Step 3 — Create Access Key

Inside IAM User:
Security Credentials → Create Access Key → CLI

We get:
- Access Key
- Secret Key 

Copy them safely.
________________________________________
## Step 4 — Configure AWS CLI

Inside VS Code terminal:
```bash
aws configure
```

Provide:
- Access Key
- Secret Key
- Region → ap-south-1 (or any other)
- Output → json 
________________________________________
## Step 5 — Verify Authentication

Run:
```bash
aws sts get-caller-identity
```
If this works:

Terraform can now access AWS.
________________________________________
## Step 6 — Run Terraform Commands

Go to project folder:
cd terraform-basic-handson

Run:
```bash
terraform init
```
```bash
terraform validate
```
Then:
```bash
terraform plan
```
Then:
```bash
terraform apply --auto-apply
```
Type:
yes
________________________________________
## Result

Terraform will create:
EC2 instance in AWS

----
Run:
```bash
terraform validate
```
We should see 'Success' message.

Also, run terraform destroy (only if handson to save the cost)
```bash
terraform destroy --auto-approve
```
----------

