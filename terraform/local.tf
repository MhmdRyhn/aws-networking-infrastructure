locals {
  prefix      = "${var.identifier}-${var.environment}-${upper(var.region)}"
  enable      = (var.number_of_private_subnet + var.number_of_public_subnet) <= 254 ? true : false
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.x.0/24"
}

locals {
  availability_zones = sort(tolist(data.aws_availability_zones.azs.names))
  az_count           = length(local.availability_zones)

  public_subnet_list = sort([
    for index in range(var.number_of_public_subnet) : "${local.availability_zones[index % local.az_count]}-${floor(index / local.az_count) + 1}"
  ])
  //  first_public_subnet = element(tolist(local.public_subnet_list), 0)
  private_subnet_list = sort([
    for index in range(var.number_of_private_subnet) : "${local.availability_zones[index % local.az_count]}-${floor(index / local.az_count) + 1}"
  ])
  //  first_private_subnet = element(tolist(local.private_subnet_list), 0)

  //  max_azs_selected   = min(length(local.availability_zones), max(2, var.max_azs_to_select))
  //  azs = toset(
  //    slice(
  //      local.availability_zones,
  //      0,
  //      local.max_azs_selected
  //    )
  //  )
}

locals {
  //  nat_count_mapper = {
  //    "single" = 1,
  //    "per-az" = min(local.az_count, var.number_of_private_subnet)
  //    "per-subnet" = length(local.private_subnet_list)
  //  }
  //  nat_count = lookup(aws_nat_gateway, var.nat_gateways_to_be_used, 1)
  //  nat_count = var.nat_gateways_to_be_used == "single" ? 1: min(local.az_count, var.number_of_private_subnet)
  //  nat_gateway_list = sort([
  //    for index in range(local.nat_count): "${local.availability_zones[index%local.az_count+1]}-${index/local.az_count+1}"
  //  ])

  first_nat        = element(tolist(local.private_subnet_list), 0)
  nat_gateway_list = var.nat_gateways_to_be_used == "single" ? [local.first_nat, local.first_nat] : local.private_subnet_list
}

