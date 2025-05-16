
variable "env" {
  default = "dev"
}

variable "project" {
  default = "homework_5"
}

variable "owner" {
  default = "aigerim"
}


variable "domain_name" {
  description = "muiapp"
  type        = string
}

variable "zone_id" {
  description = "Route 53 Hosted Zone ID"
  type        = string
}
