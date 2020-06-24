resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "${local.prefix}-internet-gateway"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  for_each      = local.azs
  allocation_id = ""
  subnet_id     = aws_subnet.private_subnet[each.key].id
  tags = {
    Name = "${local.prefix}-nat-gateway-${each.key}"
  }
}
