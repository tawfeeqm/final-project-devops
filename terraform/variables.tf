variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
}
variable "s3_bucket_name" {
  description = "S3 bucket for Terraform state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "DynamoDB table for Terraform state locking"
  type        = string
}
