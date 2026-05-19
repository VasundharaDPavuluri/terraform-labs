resource "aws_s3_bucket" "terraform_state" {
  bucket = "vasundhara-terraform-state-bucket"

  tags = {
    Name        = "Terraform Remote Backend"
    Environment = "Dev"
  }
}