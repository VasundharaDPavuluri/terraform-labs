output "vpc_id" {
  description = "VPC ID"

  value = aws_vpc.main_vpc.id
}

output "subnet_id" {
  description = "Public Subnet ID"

  value = aws_subnet.public_subnet.id
}

output "security_group_id" {
  description = "Security Group ID"

  value = aws_security_group.ec2_sg.id
}

output "ec2_instance_id" {
  description = "EC2 Instance ID"

  value = aws_instance.project_ec2.id
}

output "ec2_public_ip" {
  description = "EC2 Public IP"

  value = aws_instance.project_ec2.public_ip
}

output "ec2_public_dns" {
  description = "EC2 Public DNS"

  value = aws_instance.project_ec2.public_dns
}