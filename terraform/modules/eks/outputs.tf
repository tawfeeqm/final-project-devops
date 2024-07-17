output "cluster_name" {
  value = aws_eks_cluster.demo.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.demo.endpoint
}

output "eks_oidc_issuer" {
  value = aws_eks_cluster.demo.identity[0].oidc[0].issuer
}

