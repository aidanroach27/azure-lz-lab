variable "location" {
  description = "Region used for the deployment"
  type        = string
}

variable "address_space" {
  description = "address space assigned to the virtual network"
  type        = list(string)
}

variable "address_prefixes" {
  description = "address prefixes assigned to the subnet"
  type        = list(string)
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "key_vault_name" {
  description = "Globally Unique name of the key vault"
  type        = string
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