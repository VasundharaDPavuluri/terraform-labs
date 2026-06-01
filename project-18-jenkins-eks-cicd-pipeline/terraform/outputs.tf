output "frontend_repository_url" {
  value = aws_ecr_repository.frontend_repo.repository_url
}

output "backend_repository_url" {
  value = aws_ecr_repository.backend_repo.repository_url
}

output "eks_cluster_name" {
  value = aws_eks_cluster.main.name
}

output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
}

output "jenkins_url" {
  value = "http://${aws_instance.jenkins.public_ip}:8080"
}