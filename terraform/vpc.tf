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
  cidr_block              = replace(local.subnet_cidr, "x", index(sort(local.azs), each.key) + 1)
  availability_zone       = each.key
  map_public_ip_on_launch = true
  tags = {
    Name = "${local.prefix}-public-subnet-${each.key}"
  }
}

resource "aws_subnet" "private_subnet" {
  for_each                = local.azs
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = replace(local.subnet_cidr, "x", index(sort(local.azs), each.key) + local.max_azs_selected + 1)
  availability_zone       = each.key
  map_public_ip_on_launch = false
  tags = {
    Name = "${local.prefix}-private-subnet-${each.key}"
  }
}
