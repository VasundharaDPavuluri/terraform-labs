# -----------------------------
# VPC
# -----------------------------

resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "project-13-vpc"
  }
}

# -----------------------------
# Public Subnet
# -----------------------------

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id

  cidr_block              = var.public_subnet_cidr

  availability_zone       = var.availability_zone

  map_public_ip_on_launch = true

  tags = {
    Name = "project-13-public-subnet"
  }
}

# -----------------------------
# Internet Gateway
# -----------------------------

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "project-13-igw"
  }
}

# -----------------------------
# Route Table
# -----------------------------

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "project-13-route-table"
  }
}

# -----------------------------
# Route Table Association
# -----------------------------

resource "aws_route_table_association" "public_association" {
  subnet_id = aws_subnet.public_subnet.id

  route_table_id = aws_route_table.public_route_table.id
}

# -----------------------------
# Dynamic Security Group
# -----------------------------

resource "aws_security_group" "dynamic_sg" {
  name = "project-13-security-group"

  description = "Dynamic Security Group"

  vpc_id = aws_vpc.main_vpc.id

  # Dynamic Ingress Rules

  dynamic "ingress" {
    for_each = var.allowed_ports

    content {
      description = "Allow Port ${ingress.value}"

      from_port = ingress.value
      to_port   = ingress.value

      protocol = "tcp"

      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # Outbound Rule

  egress {
    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "project-13-dynamic-sg"
  }
}

# -----------------------------
# Multiple EC2 Instances
# -----------------------------

resource "aws_instance" "project_ec2" {
  count = var.instance_count

  ami = var.ami_id

  instance_type = var.instance_type

  subnet_id = aws_subnet.public_subnet.id

  vpc_security_group_ids = [aws_security_group.dynamic_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "project-13-ec2-${count.index + 1}"
  }
}