variable aws_region {
  description = "AWS region to deploy resources"
  type        = string
}

variable vpc_cidr {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  type = string
}

variable "public_subnet_2_cidr" {
  type = string
}

variable "private_app_subnet_1_cidr" {
  type = string
}

variable "private_app_subnet_2_cidr" {
  type = string
}

variable "private_db_subnet_1_cidr" {
  type = string
}

variable "private_db_subnet_2_cidr" {
  type = string
}

variable "availability_zone_1" {
  type = string
}

variable "availability_zone_2" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  type = string
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

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
  sensitive = true
}