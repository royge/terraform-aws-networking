variable "region" {}

variable "name" {}

variable "cidr_blocks" {
  type = "list"
  description = "List of CIDR blocks. The first will be the base CIDR of the VPC"
}


