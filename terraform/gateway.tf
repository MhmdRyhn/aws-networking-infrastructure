resource "aws_internet_gateway" "internet_gateway" {
  count  = local.enable ? 1 : 0
  vpc_id = aws_vpc.main_vpc[0].id
  tags = {
    Name = "${local.prefix}-Internet-Gateway"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  for_each      = local.enable ? toset(local.nat_gateway_list) : toset([])
  allocation_id = aws_eip.nat_eip[each.key].id
  subnet_id     = aws_subnet.private_subnet[each.key].id
  tags = {
    Name = "${local.prefix}-NAT-Gateway-${var.nat_gateways_to_be_used == "single" ? "Common" : each.key}"
  }
}
