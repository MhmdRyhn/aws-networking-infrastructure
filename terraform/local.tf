locals {
  prefix      = "${var.environment}-${upper(var.region)}"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.x.0/24"
}

locals {
  availability_zones = sort(tolist(data.aws_availability_zones.azs.names))
  max_azs_selected   = min(length(local.availability_zones), max(2, var.max_azs_to_select))
  azs = toset(
    slice(
      local.availability_zones,
      0,
      local.max_azs_selected
    )
  )
}

locals {
  first_az = element(tolist(local.azs), 0)
  nat_azs  = var.nat_gateways_to_be_used == "multiple" ? local.azs : toset([local.first_az, local.first_az])
}

