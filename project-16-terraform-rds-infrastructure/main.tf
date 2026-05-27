# VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "project-16-vpc"
  }
}

# Public Subnet 1

resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.main_vpc.id

  cidr_block = var.public_subnet_1_cidr

  availability_zone = var.availability_zone_1

  map_public_ip_on_launch = true

  tags = {
    Name = "project-16-public-subnet-1"
  }
}

# Public Subnet 2

resource "aws_subnet" "public_subnet_2" {
  vpc_id = aws_vpc.main_vpc.id

  cidr_block = var.public_subnet_2_cidr

  availability_zone = var.availability_zone_2

  map_public_ip_on_launch = true

  tags = {
    Name = "project-16-public-subnet-2"
  }
}

# Private App Subnet 1

resource "aws_subnet" "private_app_subnet_1" {
  vpc_id = aws_vpc.main_vpc.id

  cidr_block = var.private_app_subnet_1_cidr

  availability_zone = var.availability_zone_1

  tags = {
    Name = "project-16-private-app-subnet-1"
  }
}

# Private App Subnet 2

resource "aws_subnet" "private_app_subnet_2" {
  vpc_id = aws_vpc.main_vpc.id

  cidr_block = var.private_app_subnet_2_cidr

  availability_zone = var.availability_zone_2

  tags = {
    Name = "project-16-private-app-subnet-2"
  }
}

# Private DB Subnet 1

resource "aws_subnet" "private_db_subnet_1" {
  vpc_id = aws_vpc.main_vpc.id

  cidr_block = var.private_db_subnet_1_cidr

  availability_zone = var.availability_zone_1

  tags = {
    Name = "project-16-private-db-subnet-1"
  }
}

# Private DB Subnet 2

resource "aws_subnet" "private_db_subnet_2" {
  vpc_id = aws_vpc.main_vpc.id

  cidr_block = var.private_db_subnet_2_cidr

  availability_zone = var.availability_zone_2

  tags = {
    Name = "project-16-private-db-subnet-2"
  }
}

# Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "project-16-igw"
  }
}

# Elastic IP

resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "project-16-nat-eip"
  }
}

# NAT Gateway

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id

  subnet_id = aws_subnet.public_subnet_1.id

  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "project-16-nat-gateway"
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
    Name = "project-16-public-route-table"
  }
}

# Private App Route Table

resource "aws_route_table" "private_app_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"

    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "project-16-private-app-route-table"
  }
}

# Private DB Route Table

resource "aws_route_table" "private_db_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "project-16-private-db-route-table"
  }
}

# Public Route Table Association 1

resource "aws_route_table_association" "public_association_1" {
  subnet_id = aws_subnet.public_subnet_1.id

  route_table_id = aws_route_table.public_route_table.id
}

# Public Route Table Association 2

resource "aws_route_table_association" "public_association_2" {
  subnet_id = aws_subnet.public_subnet_2.id

  route_table_id = aws_route_table.public_route_table.id
}

# Private App Route Table Association 1

resource "aws_route_table_association" "private_app_association_1" {
  subnet_id = aws_subnet.private_app_subnet_1.id

  route_table_id = aws_route_table.private_app_route_table.id
}

# Private App Route Table Association 2

resource "aws_route_table_association" "private_app_association_2" {
  subnet_id = aws_subnet.private_app_subnet_2.id

  route_table_id = aws_route_table.private_app_route_table.id
}

# Private DB Route Table Association 1

resource "aws_route_table_association" "private_db_association_1" {
  subnet_id = aws_subnet.private_db_subnet_1.id

  route_table_id = aws_route_table.private_db_route_table.id
}

# Private DB Route Table Association 2

resource "aws_route_table_association" "private_db_association_2" {
  subnet_id = aws_subnet.private_db_subnet_2.id

  route_table_id = aws_route_table.private_db_route_table.id
}

# ALB Security Group

resource "aws_security_group" "alb_sg" {
  name = "project-16-alb-sg"

  description = "Allow HTTP traffic from internet"

  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port = 80
    to_port   = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "project-16-alb-sg"
  }
}

# EC2 Security Group

resource "aws_security_group" "ec2_sg" {
  name = "project-16-ec2-sg"

  description = "Allow traffic from ALB"

  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port = 80
    to_port   = 80

    protocol = "tcp"

    security_groups = [aws_security_group.alb_sg.id]
  }

  ingress {
    from_port = 22
    to_port   = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "project-16-ec2-sg"
  }
}

# RDS Security Group

resource "aws_security_group" "rds_sg" {
  name = "project-16-rds-sg"

  description = "Allow MySQL traffic from EC2"

  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port = 3306
    to_port   = 3306

    protocol = "tcp"

    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "project-16-rds-sg"
  }
}

# Launch Template

resource "aws_launch_template" "web_template" {
  name_prefix = "project-16-template"

  image_id = var.ami_id

  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = base64encode(file("userdata.sh"))

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "project-16-app-instance"
    }
  }
}

# Target Group

resource "aws_lb_target_group" "web_tg" {
  name = "project-16-target-group"

  port = 80

  protocol = "HTTP"

  vpc_id = aws_vpc.main_vpc.id

  health_check {
    path = "/"

    protocol = "HTTP"

    matcher = "200"
  }

  tags = {
    Name = "project-16-target-group"
  }
}

# Application Load Balancer

resource "aws_lb" "web_alb" {
  name = "project-16-alb"

  internal = false

  load_balancer_type = "application"

  security_groups = [aws_security_group.alb_sg.id]

  subnets = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id
  ]

  tags = {
    Name = "project-16-alb"
  }
}

# ALB Listener

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.web_alb.arn

  port = 80

  protocol = "HTTP"

  default_action {
    type = "forward"

    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}

# Auto Scaling Group

resource "aws_autoscaling_group" "web_asg" {
  name = "project-16-asg"

  desired_capacity = var.desired_capacity

  min_size = var.min_size

  max_size = var.max_size

  vpc_zone_identifier = [
    aws_subnet.private_app_subnet_1.id,
    aws_subnet.private_app_subnet_2.id
  ]

  target_group_arns = [
    aws_lb_target_group.web_tg.arn
  ]

  health_check_type = "EC2"

  launch_template {
    id = aws_launch_template.web_template.id

    version = "$Latest"
  }

  tag {
    key = "Name"

    value = "project-16-app-instance"

    propagate_at_launch = true
  }
}

# DB Subnet Group

resource "aws_db_subnet_group" "db_subnet_group" {
  name = "project-16-db-subnet-group"

  subnet_ids = [
    aws_subnet.private_db_subnet_1.id,
    aws_subnet.private_db_subnet_2.id
  ]

  tags = {
    Name = "project-16-db-subnet-group"
  }
}

# RDS MySQL Instance

resource "aws_db_instance" "mysql_db" {
  identifier = "project16-mysql-db"

  allocated_storage = 20

  engine = "mysql"

  engine_version = "8.0"

  instance_class = "db.t3.micro"

  db_name = "project16db"

  username = var.db_username

  password = var.db_password

  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]

  publicly_accessible = false

  skip_final_snapshot = true

  multi_az = false

  tags = {
    Name = "project-16-rds-mysql"
  }
}