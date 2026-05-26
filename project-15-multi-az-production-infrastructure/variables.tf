variable aws_region {
  type        = string
  description = "AWS region"
}

variable vpc_cidr {
  type        = string
  description = "CIDR block for the VPC"
}

variable public_subnet_1_cidr {
  type        = string
  description = "CIDR block for the first public subnet"
}

variable public_subnet_2_cidr {
  type        = string
  description = "CIDR block for the second public subnet"
}

variable private_subnet_1_cidr {
  type        = string
  description = "CIDR block for the first private subnet"
}

variable private_subnet_2_cidr {
  type        = string
  description = "CIDR block for the second private subnet"
}

variable availability_zone_1 {
  type        = string
  description = "First availability zone"
}

variable availability_zone_2 {
  type        = string
  description = "Second availability zone"
}

variable instance_type {
  type        = string
  description = "EC2 instance type"
}

variable ami_id {
  type        = string
  description = "AMI ID for the EC2 instances"
}

variable "desired_capacity" {
  type = number
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}