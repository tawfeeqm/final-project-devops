output "private_subnet_ids" {
  value = [
    aws_subnet.private-eu-north-1a.id,
    aws_subnet.private-eu-north-1b.id
  ]
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public-eu-north-1a.id,
    aws_subnet.public-eu-north-1b.id
  ]
}
