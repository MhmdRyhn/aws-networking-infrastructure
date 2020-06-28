resource "aws_route_table" "public_route_table" {
  count  = local.enable ? 1 : 0
  vpc_id = aws_vpc.main_vpc[0].id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway[0].id
  }
  tags = {
    Name = "${local.prefix}-public-route-table"
  }
}

resource "aws_route_table_association" "public_subnet_routing" {
  for_each       = local.enable ? toset(local.public_subnet_list) : toset([])
  route_table_id = aws_route_table.public_route_table[0].id
  subnet_id      = aws_subnet.public_subnet[each.key].id
}


resource "aws_route_table" "private_route_table" {
  for_each = local.enable ? toset(local.nat_gateway_list) : toset([])
  vpc_id   = aws_vpc.main_vpc[0].id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway[each.key].id
  }
  tags = {
    Name = "${local.prefix}-private-route-table-${var.nat_gateways_to_be_used == "single" ? "Common" : each.key}"
  }
}

resource "aws_route_table_association" "private_subnet_routing" {
  for_each       = local.enable ? toset(local.private_subnet_list) : toset([])
  route_table_id = aws_route_table.private_route_table[var.nat_gateways_to_be_used == "single" ? local.first_nat : each.key].id
  subnet_id      = aws_subnet.private_subnet[each.key].id
}
