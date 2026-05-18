output "vpc_id" {
  description = "The ID of the created VPC."
  value       = module.vpc.vpc_id
}

output "subnet_id" {
  description = "The ID of the public subnet."
  value       = module.vpc.subnet_id
}

output "security_group_id" {
  description = "The ID of the created security group."
  value = module.security_group.security_group_id
}

output "ec2_public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = module.ec2.ec2_public_ip
}

output "ec2_public_dns" {
  description = "The public DNS name of the EC2 instance."
  value       = module.ec2.ec2_public_dns
}