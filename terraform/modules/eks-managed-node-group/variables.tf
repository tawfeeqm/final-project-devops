variable "name" {
  description = "The name of the EKS managed node group"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version of the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "cluster_primary_security_group_id" {
  description = "The primary security group of the EKS cluster"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
}

variable "min_size" {
  description = "Minimum number of nodes in the node group"
  type        = number
}

variable "max_size" {
  description = "Maximum number of nodes in the node group"
  type        = number
}

variable "desired_size" {
  description = "Desired number of nodes in the node group"
  type        = number
}

variable "instance_types" {
  description = "List of instance types for the node group"
  type        = list(string)
}

variable "capacity_type" {
  description = "Capacity type for the node group (ON_DEMAND or SPOT)"
  type        = string
}

variable "labels" {
  description = "Labels to apply to the node group"
  type        = map(string)
}

variable "taints" {
  description = "Taints to apply to the node group"
  type        = map(any)
}

variable "tags" {
  description = "Tags to apply to the node group"
  type        = map(string)
}

variable "cluster_service_cidr" {
  description = "The CIDR block for the Kubernetes service"
  type        = string
}
