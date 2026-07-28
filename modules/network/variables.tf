variable "location" {
  type        = string
  description = "locations"
}

variable "resource_group_name"{
type = string
description = "Name of the resource group"
}

variable "address_space" {
  type        = list(string)
  description = "address space for virtual network"
}

variable "address_prefixes" {
  type        = list(string)
  description = "address prefixes for subnet"
}