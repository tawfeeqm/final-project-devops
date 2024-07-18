variable "vpc_id" {
  description = "The VPC ID where the NAT Gateway will be created"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID where the NAT Gateway will be created"
  type        = string
}

variable "igw_id" {
  description = "The Internet Gateway ID"
  type        = string
}
