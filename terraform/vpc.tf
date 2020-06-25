resource "aws_vpc" "main_vpc" {
  cidr_block           = local.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "${local.prefix}-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  for_each                = local.azs
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = replace(local.subnet_cidr, "x", index(tolist(local.azs), each.key) + 1)
  availability_zone       = each.key
  map_public_ip_on_launch = true
  tags = {
    Name = "${local.prefix}-public-subnet-${each.key}"
  }
}

resource "aws_subnet" "private_subnet" {
  for_each                = local.azs
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = replace(local.subnet_cidr, "x", index(tolist(local.azs), each.key) + 11)
  availability_zone       = each.key
  map_public_ip_on_launch = false
  tags = {
    Name = "${local.prefix}-private-subnet-${each.key}"
  }
}

resource "aws_eip" "nat_eip" {
  for_each = local.nat_azs
  vpc      = true
  tags = {
    Name = "${local.prefix}-NAT-Elastic-IP-${var.nat_gateways_to_be_used == "multiple" ? each.key : "Single"}"
  }
}
