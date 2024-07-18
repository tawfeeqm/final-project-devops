resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table_association" "private-eu-north-1a" {
  subnet_id      = var.private_subnet_ids[0]
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-eu-north-1b" {
  subnet_id      = var.private_subnet_ids[1]
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public-eu-north-1a" {
  subnet_id      = var.public_subnet_ids[0]
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-eu-north-1b" {
  subnet_id      = var.public_subnet_ids[1]
  route_table_id = aws_route_table.public.id
}

