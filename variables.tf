variable "region" {
  description = "AWS region"
}

variable "name" {
  description = "Namespace"
}

variable "cidr_blocks" {
  type = "list"
  description = "List of CIDR blocks. The first will be the base CIDR of the VPC"
}


