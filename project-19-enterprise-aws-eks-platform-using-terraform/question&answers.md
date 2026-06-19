# Project-19
### What is the purpose of versions.tf ?
Locks Terraform version.
Locks AWS provider version.
Prevents:
Works on my machine
Fails on yours

### Why do we use versions.tf?
To ensure consistent Terraform and provider versions across all environments and team members.

### Why outputs?
Outputs allow modules to share resource information with other modules and the root module.

### Why create multiple subnets?
For high availability across multiple Availability Zones. If one AZ fails, workloads continue running in another AZ.

### Why Public Subnets?
Used for:
Internet Gateway
Load Balancers
Ingress Controllers

### Why Private Subnets?  (Private = safer)
Used for:
EKS Nodes
Applications
Databases

### Why two public and two private subnets?
To provide high availability across multiple Availability Zones and support production-grade workloads.

### Why are EKS nodes deployed in private subnets?
Worker nodes should not be directly exposed to the internet. Public access should be provided through load balancers and ingress controllers.

### What does map_public_ip_on_launch do?
Automatically assigns public IP addresses to instances launched in public subnets.

### What Is Internet Gateway?
Internet Gateway is a horizontally scaled AWS-managed component that enables communication between a VPC and the Internet.

### What Is Route Table?
A route table determines where network traffic is directed.

What does 0.0.0.0/0 mean?
It represents all IPv4 addresses and acts as the default route for internet-bound traffic.

### What is NAT Gateway?
NAT Gateway allows resources in private subnets to access the Internet while preventing inbound connections from the Internet.

### Why place NAT Gateway in a public subnet?
NAT Gateway requires direct Internet access through an Internet Gateway, therefore it must be deployed in a public subnet.

### Why place EKS nodes in private subnets?
To reduce attack surface and prevent direct Internet exposure.

### Explain your VPC module.
The VPC module provisions a VPC with public and private subnets across multiple Availability Zones. Public subnets are associated with an Internet Gateway for inbound and outbound internet access, while private subnets route outbound traffic through a NAT Gateway. Route tables and route associations ensure proper traffic flow. The module exposes VPC and subnet information through outputs for consumption by downstream modules such as EKS.

### Why does EKS need a Cluster Role?
The EKS control plane uses the cluster IAM role to manage AWS resources such as networking and cluster operations.

### Why does the Node Group need IAM?
Worker nodes require permissions to join the cluster, communicate with EKS APIs, manage pod networking through the VPC CNI plugin, and pull container images from Amazon ECR.

### Why AmazonEC2ContainerRegistryReadOnly?
EKS worker nodes pull Docker images from ECR, so they require read access to ECR repositories.

### What does aws_eks_cluster create?
It provisions the Amazon EKS control plane, including the Kubernetes API server and managed control plane components. Worker nodes are not created by this resource.

### Does EKS Cluster Create Nodes?
No. The EKS cluster resource creates only the control plane. Worker nodes are created separately using Managed Node Groups or self-managed nodes.

### What is a Managed Node Group?
A Managed Node Group is an AWS-managed collection of EC2 worker nodes that automatically join an EKS cluster. AWS handles provisioning, lifecycle management, upgrades, and health monitoring.

### Why deploy nodes in private subnets?
Worker nodes should not be directly accessible from the internet. Public access should be provided through load balancers and ingress controllers.

### Difference Between EKS Cluster and Node Group

| EKS Cluster | Node Group |
|------------|------------|
| Control Plane | Worker Nodes |
| Managed by AWS | EC2 Instances |
| Hosts Kubernetes API Server | Runs Application Pods |
| Contains Scheduler & Controller Manager | Executes Application Workloads |
| Manages Cluster State | Provides Compute Capacity |
| Responsible for Orchestration | Responsible for Workload Execution |
| No Direct Application Deployment | Applications Run Here |
| Automatically Managed by AWS | Can be Managed or Self-Managed |

### How do modules communicate?
Modules communicate through outputs and variables. For example, the VPC module outputs subnet IDs, which are consumed by the EKS module through input variables.
Example: module.vpc.private_subnet_ids
