output "eks_oidc_arn" {
  value = aws_iam_openid_connect_provider.eks.arn
}
