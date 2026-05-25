output "vpc_id" {
  description = "VPC ID"

  value = aws_vpc.main_vpc.id
}

output "public_subnet_1_id" {
  description = "Public Subnet 1 ID"

  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
  description = "Public Subnet 2 ID"

  value = aws_subnet.public_subnet_2.id
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS Name"

  value = aws_lb.web_alb.dns_name
}

output "target_group_arn" {
  description = "Target Group ARN"

  value = aws_lb_target_group.web_tg.arn
}

output "autoscaling_group_name" {
  description = "Auto Scaling Group Name"

  value = aws_autoscaling_group.web_asg.name
}