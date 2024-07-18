provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "expensy-terraform-state"
    key            = "states/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.58.0"
    }
  }
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc_id
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
}

module "nat" {
  source    = "./modules/nat"
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.subnets.public_subnet_ids[0]
  igw_id    = module.igw.igw_id
}

module "routes" {
  source             = "./modules/routes"
  vpc_id             = module.vpc.vpc_id
  nat_gateway_id     = module.nat.nat_gateway_id
  igw_id             = module.igw.igw_id
  private_subnet_ids = module.subnets.private_subnet_ids
  public_subnet_ids  = module.subnets.public_subnet_ids
}

module "eks" {
  source             = "./modules/eks"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.subnets.private_subnet_ids
  public_subnet_ids  = module.subnets.public_subnet_ids
}

module "nodes" {
  source             = "./modules/nodes"
  cluster_name       = module.eks.cluster_name
  private_subnet_ids = module.subnets.private_subnet_ids
}

module "iam_oidc" {
  source           = "./modules/iam-oidc"
  eks_oidc_issuer  = module.eks.eks_oidc_issuer
}

module "iam_test" {
  source          = "./modules/iam-test"
  eks_oidc_issuer = module.eks.eks_oidc_issuer
  eks_oidc_arn    = module.iam_oidc.eks_oidc_arn
}

module "eks_autoscaler" {
  source          = "./modules/eks-autoscaler"
  eks_oidc_issuer = module.eks.eks_oidc_issuer
  eks_oidc_arn    = module.iam_oidc.eks_oidc_arn
}

module "security_group" {
  source       = "./modules/security-group"
  cluster_name = module.eks.cluster_name
  vpc_id       = module.vpc.vpc_id
}
