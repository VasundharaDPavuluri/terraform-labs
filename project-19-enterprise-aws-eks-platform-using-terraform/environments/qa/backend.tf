terraform {

  backend "s3" {

    bucket         = "vasundhara-terraform-state-bucket"
    key            = "qa/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}