resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "${local.prefix}-public-route-table"
  }
}

resource "aws_route_table_association" "public_subnet_routing" {
  for_each       = local.azs
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet[each.key].id
}


resource "aws_route_table" "private_route_table" {
  for_each = local.nat_azs
  vpc_id   = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway[each.key].id
  }
  tags = {
    Name = "${local.prefix}-private-route-table-${var.nat_gateways_to_be_used == "multiple" ? each.key : "common"}"
  }
}

resource "aws_route_table_association" "private_subnet_routing" {
  for_each       = local.azs
  route_table_id = aws_route_table.private_route_table[var.nat_gateways_to_be_used == "multiple" ? each.key : local.first_az].id
  subnet_id      = aws_subnet.private_subnet[each.key].id
}
