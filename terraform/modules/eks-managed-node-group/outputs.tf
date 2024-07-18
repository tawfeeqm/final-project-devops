output "node_group_arn" {
  description = "ARN of the EKS managed node group"
  value       = module.eks_managed_node_group.node_group_arn
}

output "node_group_id" {
  description = "ID of the EKS managed node group"
  value       = module.eks_managed_node_group.node_group_id
}

output "node_group_status" {
  description = "Status of the EKS managed node group"
  value       = module.eks_managed_node_group.node_group_status
}
