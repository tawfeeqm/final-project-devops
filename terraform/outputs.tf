output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_ids" {
  value = module.subnets.private_subnet_ids
}

output "public_subnet_ids" {
  value = module.subnets.public_subnet_ids
}

output "nat_gateway_id" {
  value = module.nat.nat_gateway_id
}

output "igw_id" {
  value = module.igw.igw_id
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_oidc_issuer" {
  value = module.eks.eks_oidc_issuer
}

output "eks_oidc_arn" {
  value = module.iam_oidc.eks_oidc_arn
}

output "eks_autoscaler_arn" {
  value = module.eks_autoscaler.eks_cluster_autoscaler_arn
}