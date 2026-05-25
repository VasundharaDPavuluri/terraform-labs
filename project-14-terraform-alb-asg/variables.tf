variable "aws_region" {
  description = "AWS Region"

  type = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"

  type = string
}

variable "public_subnet_1_cidr" {
  description = "Public Subnet 1 CIDR"

  type = string
}

variable "public_subnet_2_cidr" {
  description = "Public Subnet 2 CIDR"

  type = string
}

variable "availability_zone_1" {
  description = "Availability Zone 1"

  type = string
}

variable "availability_zone_2" {
  description = "Availability Zone 2"

  type = string
}

variable "instance_type" {
  description = "EC2 Instance Type"

  type = string
}

variable "ami_id" {
  description = "AMI ID"

  type = string
}

variable "desired_capacity" {
  description = "Desired EC2 instances"

  type = number
}

variable "max_size" {
  description = "Maximum EC2 instances"

  type = number
}

variable "min_size" {
  description = "Minimum EC2 instances"

  type = number
}