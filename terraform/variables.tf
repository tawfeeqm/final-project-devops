variable "region" {
  description = "AWS region"
  default     = "eu-north-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

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
