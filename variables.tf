variable "location" {
  type        = string
  description = "locations"
  default     = "eastus2"
}

variable "address_space" {
  type        = list(string)
  description = "address space for virtual network"
  default     = ["10.0.0.0/16"]
}

variable "address_prefixes" {
  type        = list(string)
  description = "address prefixes for subnet"
  default     = ["10.0.1.0/24"]
}