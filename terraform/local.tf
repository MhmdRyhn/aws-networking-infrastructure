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
  private_subnet_list = sort([
    for index in range(var.number_of_private_subnet) : "${local.availability_zones[index % local.az_count]}-${floor(index / local.az_count) + 1}"
  ])
}

locals {
  first_nat        = element(tolist(local.private_subnet_list), 0)
  nat_gateway_list = var.nat_gateways_to_be_used == "single" ? [local.first_nat, local.first_nat] : local.private_subnet_list
}

