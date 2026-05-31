# Frontend ECR Repository

resource "aws_ecr_repository" "frontend_repo" {
  name = "project-18-frontend"

  image_scanning_configuration {
    scan_on_push = true
  }
}

# Backend ECR Repository

resource "aws_ecr_repository" "backend_repo" {
  name = "project-18-backend"

  image_scanning_configuration {
    scan_on_push = true
  }
}