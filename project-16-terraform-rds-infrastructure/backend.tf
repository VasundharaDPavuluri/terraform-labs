terraform {
  backend "s3" {
    bucket         = "vasundhara-terraform-state-bucket"
    key            = "project-16/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}