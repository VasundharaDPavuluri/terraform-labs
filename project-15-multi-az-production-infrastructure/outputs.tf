output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "public_subnet_1_id" {
  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_subnet_2.id
}

output "private_subnet_1_id" {
  value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.private_subnet_2.id
}

output "alb_dns_name" {
  value = aws_lb.web_alb.dns_name
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway.id
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.web_asg.name
}