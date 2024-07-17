variable "eks_oidc_issuer" {
  description = "The OIDC issuer URL of the EKS cluster"
  type        = string
}

variable "eks_oidc_arn" {
  description = "The OIDC ARN of the EKS cluster"
  type        = string
}
