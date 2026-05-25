output "vpc_id" {
  description = "VPC ID"

  value = aws_vpc.main_vpc.id
}

output "subnet_id" {
  description = "Subnet ID"

  value = aws_subnet.public_subnet.id
}

output "security_group_id" {
  description = "Dynamic Security Group ID"

  value = aws_security_group.dynamic_sg.id
}

output "ec2_public_ips" {
  description = "Public IPs of EC2 instances"

  value = aws_instance.project_ec2[*].public_ip
}

output "ec2_instance_ids" {
  description = "EC2 Instance IDs"

  value = aws_instance.project_ec2[*].id
}