output "vpc_id" {
    description = "The ID of the created VPC."
    value       = aws_vpc.main_vpc.id
}

output "subnet_id" {
  value = aws_subnet.public_subnet.id
}