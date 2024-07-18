provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "expensy_terraform_state" {
  bucket = "expensy-terraform-state"

  tags = {
    Name = "expensy-terraform-state"
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform_lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  depends_on = [aws_s3_bucket.expensy_terraform_state]
}

