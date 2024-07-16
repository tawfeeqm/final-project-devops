terraform {
  backend "s3" {
    bucket         = "expency-terraform-state"
    key            = "states/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}

#module "ref" {
 # source      = "./modules/s3"
 # 
#}