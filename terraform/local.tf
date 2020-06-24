locals {
  prefix      = "${var.environment}-${var.region}"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.x.0/24"
}

locals {
  availability_zones = tolist(data.aws_availability_zones.azs.names)
  max_azs_selected   = min(length(local.availability_zones), max(2, var.max_azs_to_select))
  azs = toset(
    slice(
      local.availability_zones,
      0,
      local.max_azs_selected
    )
  )
}

