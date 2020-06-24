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
# If this is greater than azs in that region then all azs will be selected.
variable "max_azs_to_select" {
  type        = number
  description = "Number of maximum availability zones to be selected."
  default     = 2
}

