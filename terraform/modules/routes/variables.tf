variable "vpc_id" {
  description = "The VPC ID where the route tables will be created"
  type        = string
}

variable "nat_gateway_id" {
  description = "The NAT Gateway ID"
  type        = string
}

variable "igw_id" {
  description = "The Internet Gateway ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}
