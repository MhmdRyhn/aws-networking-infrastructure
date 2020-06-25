resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "${local.prefix}-Internet-Gateway"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  for_each      = local.nat_azs
  allocation_id = aws_eip.nat_eip[each.key].id
  subnet_id     = aws_subnet.private_subnet[each.key].id
  tags = {
    Name = "${local.prefix}-NAT-Gateway-${var.nat_gateways_to_be_used == "multiple" ? each.key : "common"}"
  }
}
