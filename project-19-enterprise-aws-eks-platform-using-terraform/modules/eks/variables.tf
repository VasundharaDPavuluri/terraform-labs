variable "environment" {
  type = string
}

variable "cluster_role_arn" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}