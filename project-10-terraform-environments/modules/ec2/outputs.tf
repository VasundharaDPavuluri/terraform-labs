output "ec2_public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = aws_instance.project_ec2.public_ip
}

output "ec2_public_dns" {
  description = "The public DNS name of the EC2 instance."
  value       = aws_instance.project_ec2.public_dns
}