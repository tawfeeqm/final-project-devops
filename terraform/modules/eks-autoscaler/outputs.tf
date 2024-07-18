output "eks_cluster_autoscaler_arn" {
  description = "The ARN of the EKS cluster autoscaler role"
  value       = aws_iam_role.eks_cluster_autoscaler.arn
}
