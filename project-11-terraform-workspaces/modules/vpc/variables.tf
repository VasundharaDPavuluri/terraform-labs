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

variable "environment" {
  description = "Environment Name"
  type        = string
}