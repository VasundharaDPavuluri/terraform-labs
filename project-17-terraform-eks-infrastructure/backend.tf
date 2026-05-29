terraform {
  backend "s3" {
    bucket         = "vasundhara-terraform-state-bucket"
    key            = "project-17/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}