provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "expensy_terraform_state" {
  bucket = "expency-terraform-state"

  tags = {
    Name        = "expency-terraform-state"
  }
}


resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "terraform-lock"
  }
}