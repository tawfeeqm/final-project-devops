module "eks_al2" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "${local.name}-al2"
  cluster_version = "1.30"

  # EKS Addons
  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    example = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2_x86_64"
      instance_types = ["m6i.large"]

      min_size = 2
      max_size = 5
      # This value is ignored after the initial creation
      # https://github.com/bryantbiggs/eks-desired-size-hack
      desired_size = 2
    }
  }

  tags = local.tags
}


















# module "eks_managed_node_group" {
#  source = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
#
#  name                              = var.name
#  cluster_name                      = var.cluster_name
#  cluster_version                   = var.cluster_version
#  subnet_ids                        = var.subnet_ids
#  cluster_primary_security_group_id = var.cluster_primary_security_group_id
#  vpc_security_group_ids            = var.vpc_security_group_ids
#  cluster_service_cidr              = var.cluster_service_cidr
#
#  min_size     = var.min_size
#  max_size     = var.max_size
#  desired_size = var.desired_size
#
#  instance_types = var.instance_types
#  capacity_type  = var.capacity_type
#
#  labels = var.labels
#  taints = var.taints
#  tags   = var.tags
#}
