variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}

variable "ami_id" {
  description = "The ID of the AMI to use for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance to create."
  type        = string
}

variable "environment" {
  description = "The environment for which the infrastructure is being provisioned (e.g., dev, staging, prod)."
  type = string
}