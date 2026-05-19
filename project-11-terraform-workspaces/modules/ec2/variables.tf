variable "ami_id" {
  description = "The AMI ID for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be launched."
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group for the EC2 instance."
  type        = string
}
 
variable "environment" {
  description = "Environment Name"
  type        = string
}