variable "region" {
  type        = string
  description = "Preferred AWS region."
}

variable "access_key" {
  type        = string
  description = "IAM user access key."
}

variable "secret_access_key" {
  type        = string
  description = "IAM user secret access key."
}

variable "environment" {
  type        = string
  description = "It can be dev, test, stable, staging, uat or prod."
  default     = "dev"
}

# Number of maximum availability zones. There'll be one private and one public subnet per az.
# If the value is greater than number of azs in that region, then all azs will be selected.
#If the value is less than 2, then 2 will be considered (i.e., the minimum value should be 2).
variable "max_azs_to_select" {
  type        = number
  description = "Number of maximum availability zones to be selected."
  default     = 2
}

# If value is `single`, one NAT gateway will be used for all the subnets.
# If value is `multiple`, one NAT gateway will be used per subnet.
# If the value is other than `multiple`, it'll be considered as `single`.
variable "nat_gateways_to_be_used" {
  type        = string
  description = "Value should be either `single` or `multiple`"
  default     = "single"
}
