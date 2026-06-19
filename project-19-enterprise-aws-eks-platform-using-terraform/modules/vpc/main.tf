resource "aws_vpc" "this" {

  cidr_block = var.vpc_cidr

  tags = {
    Name        = "${var.environment}-vpc"
    Environment = var.environment
  }
}

resource "aws_subnet" "public_1" {

  vpc_id            = aws_vpc.this.id

  cidr_block        = var.public_subnet_1_cidr

  availability_zone = var.az_1

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-public-1"
  }
}

resource "aws_subnet" "public_2" {

  vpc_id            = aws_vpc.this.id

  cidr_block        = var.public_subnet_2_cidr

  availability_zone = var.az_2

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-public-2"
  }
}

resource "aws_subnet" "private_1" {

  vpc_id            = aws_vpc.this.id

  cidr_block        = var.private_subnet_1_cidr

  availability_zone = var.az_1

  tags = {
    Name = "${var.environment}-private-1"
  }
}

resource "aws_subnet" "private_2" {

  vpc_id            = aws_vpc.this.id

  cidr_block        = var.private_subnet_2_cidr

  availability_zone = var.az_2

  tags = {
    Name = "${var.environment}-private-2"
  }
}

resource "aws_internet_gateway" "this" {

  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.environment}-igw"
  }
}

resource "aws_route_table" "public" {

  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.environment}-public-rt"
  }
}

resource "aws_route" "public_internet" {

  route_table_id = aws_route_table.public.id

  destination_cidr_block = "0.0.0.0/0"

  gateway_id = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "public_1" {

  subnet_id      = aws_subnet.public_1.id

  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {

  subnet_id      = aws_subnet.public_2.id

  route_table_id = aws_route_table.public.id
}

resource "aws_eip" "nat" {

  domain = "vpc"
}

resource "aws_nat_gateway" "this" {

  allocation_id = aws_eip.nat.id

  subnet_id = aws_subnet.public_1.id

  tags = {
    Name = "${var.environment}-nat"
  }
}

resource "aws_route_table" "private" {

  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.environment}-private-rt"
  }
}

resource "aws_route" "private_nat" {

  route_table_id = aws_route_table.private.id

  destination_cidr_block = "0.0.0.0/0"

  nat_gateway_id = aws_nat_gateway.this.id
}

resource "aws_route_table_association" "private_1" {

  subnet_id = aws_subnet.private_1.id

  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {

  subnet_id = aws_subnet.private_2.id

  route_table_id = aws_route_table.private.id
}

resource "aws_security_group" "eks" {

  name        = "${var.environment}-eks-sg"
  description = "EKS Security Group"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
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
    Name = "${var.environment}-eks-sg"
  }
}

