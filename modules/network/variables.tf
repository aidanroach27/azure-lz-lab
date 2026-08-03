variable "location" {
  type        = string
  description = "locations"
}

variable "resource_group_name" {
  type        = string
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

variable "security_rules" {
  description = "Security rules applied to the network security group"

  type = map(object({
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}