output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "alb_dns_name" {
  value = aws_lb.web_alb.dns_name
}

output "rds_endpoint" {
  value = aws_db_instance.mysql_db.endpoint
}

output "db_name" {
  value = aws_db_instance.mysql_db.db_name
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.web_asg.name
}