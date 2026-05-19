# VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "project-12-vpc"
  }
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "project-12-public-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "project-12-igw"
  }
}

# Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "project-12-route-table"
  }
}

# Route Table Association
resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public_subnet.id

  route_table_id = aws_route_table.public_route_table.id
}

# Security Group
resource "aws_security_group" "ec2_sg" {
  name        = "project-12-security-group"

  description = "Allow SSH and HTTP"

  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = "SSH Access"

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP Access"

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "project-12-ec2-sg"
  }
}

# EC2 Instance
resource "aws_instance" "project_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "project-12-ec2"
  }

  # SSH Connection
  connection {
    type = "ssh"

    user = "ec2-user"

    private_key = file(var.private_key_path)

    host = self.public_ip
  }

  # Remote Exec Provisioner
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }

  # Local Exec Provisioner
  provisioner "local-exec" {
    command = "echo EC2 Instance Created with Public IP: ${self.public_ip}"
  }
}