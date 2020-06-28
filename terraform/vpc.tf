resource "aws_vpc" "main_vpc" {
  count                = local.enable ? 1 : 0
  cidr_block           = local.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "${local.prefix}-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  for_each                = local.enable ? toset(local.public_subnet_list) : toset([])
  vpc_id                  = aws_vpc.main_vpc[0].id
  cidr_block              = replace(local.subnet_cidr, "x", index(tolist(local.public_subnet_list), each.key) + 1)
  availability_zone       = substr(each.key, 0, length(var.region) + 1)
  map_public_ip_on_launch = true
  tags = {
    Name = "${local.prefix}-public-subnet-${each.key}"
  }
}

resource "aws_subnet" "private_subnet" {
  for_each                = local.enable ? toset(local.private_subnet_list) : toset([])
  vpc_id                  = aws_vpc.main_vpc[0].id
  cidr_block              = replace(local.subnet_cidr, "x", index(tolist(local.private_subnet_list), each.key) + var.number_of_public_subnet + 1)
  availability_zone       = substr(each.key, 0, length(var.region) + 1)
  map_public_ip_on_launch = false
  tags = {
    Name = "${local.prefix}-private-subnet-${each.key}"
  }
}

resource "aws_eip" "nat_eip" {
  for_each = local.enable ? toset(local.nat_gateway_list) : toset([])
  vpc      = true
  tags = {
    Name = "${local.prefix}-NAT-Elastic-IP-${var.nat_gateways_to_be_used == "single" ? "Single" : each.key}"
  }
}
