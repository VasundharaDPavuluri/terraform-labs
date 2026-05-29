resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "main-vpc"
  }
}

# Public Subnet 1

resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.main_vpc.id

  cidr_block = var.public_subnet_1_cidr

  availability_zone = var.availability_zone_1

  map_public_ip_on_launch = true

  tags = {
    Name = "project-17-public-subnet-1"

    "kubernetes.io/role/elb" = "1"
  }
}

# Public Subnet 2

resource "aws_subnet" "public_subnet_2" {
  vpc_id = aws_vpc.main_vpc.id

  cidr_block = var.public_subnet_2_cidr

  availability_zone = var.availability_zone_2

  map_public_ip_on_launch = true

  tags = {
    Name = "project-17-public-subnet-2"

    "kubernetes.io/role/elb" = "1"
  }
}

# Private Subnet 1

resource "aws_subnet" "private_subnet_1" {
  vpc_id = aws_vpc.main_vpc.id

  cidr_block = var.private_subnet_1_cidr

  availability_zone = var.availability_zone_1

  tags = {
    Name = "project-17-private-subnet-1"

    "kubernetes.io/role/internal-elb" = "1"
  }
}

# Private Subnet 2

resource "aws_subnet" "private_subnet_2" {
  vpc_id = aws_vpc.main_vpc.id

  cidr_block = var.private_subnet_2_cidr

  availability_zone = var.availability_zone_2

  tags = {
    Name = "project-17-private-subnet-2"

    "kubernetes.io/role/internal-elb" = "1"
  }
}

# Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "project-17-igw"
  }
}

# Elastic IP

resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "project-17-nat-eip"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id

  subnet_id = aws_subnet.public_subnet_1.id

  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "project-17-nat-gw"
  }
}

# Public Route Table

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "project-17-public-route-table"
  }
}

# Private Route Table

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"

    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "project-17-private-route-table"
  }
}

# Public Route Association 1

resource "aws_route_table_association" "public_association_1" {
  subnet_id = aws_subnet.public_subnet_1.id

  route_table_id = aws_route_table.public_route_table.id
}

# Public Route Association 2

resource "aws_route_table_association" "public_association_2" {
  subnet_id = aws_subnet.public_subnet_2.id

  route_table_id = aws_route_table.public_route_table.id
}

# Private Route Association 1

resource "aws_route_table_association" "private_association_1" {
  subnet_id = aws_subnet.private_subnet_1.id

  route_table_id = aws_route_table.private_route_table.id
}

# Private Route Association 2

resource "aws_route_table_association" "private_association_2" {
  subnet_id = aws_subnet.private_subnet_2.id

  route_table_id = aws_route_table.private_route_table.id
}

# EKS Cluster IAM Role

resource "aws_iam_role" "eks_cluster_role" {
  name = "project-17-eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "eks.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}

# EKS Cluster Policy

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role = aws_iam_role.eks_cluster_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# Node Group IAM Role

resource "aws_iam_role" "node_group_role" {
  name = "project-17-node-group-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Worker Node Policy

resource "aws_iam_role_policy_attachment" "worker_node_policy" {
  role = aws_iam_role.node_group_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

# CNI Policy

resource "aws_iam_role_policy_attachment" "cni_policy" {
  role = aws_iam_role.node_group_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

# ECR Read Only Policy

resource "aws_iam_role_policy_attachment" "ecr_policy" {
  role = aws_iam_role.node_group_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

# EKS Cluster

resource "aws_eks_cluster" "eks_cluster" {
  name = "project-17-eks-cluster"

  role_arn = aws_iam_role.eks_cluster_role.arn

  version = var.eks_version

  vpc_config {
    subnet_ids = [
      aws_subnet.private_subnet_1.id,
      aws_subnet.private_subnet_2.id,
      aws_subnet.public_subnet_1.id,
      aws_subnet.public_subnet_2.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]

  tags = {
    Name = "project-17-eks-cluster"
  }
}

# EKS Node Group

resource "aws_eks_node_group" "node_group" {
  cluster_name = aws_eks_cluster.eks_cluster.name

  node_group_name = "project-17-node-group"

  node_role_arn = aws_iam_role.node_group_role.arn

  subnet_ids = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]

  scaling_config {
    desired_size = var.desired_size

    min_size = var.min_size

    max_size = var.max_size
  }

  instance_types = [var.instance_type]

  capacity_type = "ON_DEMAND"

  depends_on = [
    aws_iam_role_policy_attachment.worker_node_policy,
    aws_iam_role_policy_attachment.cni_policy,
    aws_iam_role_policy_attachment.ecr_policy
  ]

  tags = {
    Name = "project-17-node-group"
  }
}