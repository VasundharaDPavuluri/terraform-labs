output "s3_bucket_name" {
  description = "Terraform backend S3 bucket name"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "dynamodb_table_name" {
  description = "Terraform state lock DynamoDB table"
  value       = aws_dynamodb_table.terraform_locks.name
}