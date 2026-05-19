output "vpc_id" {
  description = "VPC ID"

  value = module.vpc.vpc_id
}

output "subnet_id" {
  description = "Subnet ID"

  value = module.vpc.subnet_id
}

output "security_group_id" {
  description = "Security Group ID"

  value = module.security_group.security_group_id
}

output "ec2_public_ip" {
  description = "EC2 Public IP"

  value = module.ec2.ec2_public_ip
}

output "ec2_public_dns" {
  description = "EC2 Public DNS"

  value = module.ec2.ec2_public_dns
}