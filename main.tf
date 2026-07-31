terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  resource_provider_registrations = "core"
}

data "azurerm_client_config" "current" {}
data "azurerm_policy_definition" "lab" {
  display_name = "Audit resource location matches resource group location"
}

resource "azurerm_resource_group" "lab" {
  name     = "rg-lz-lab"
  location = var.location
}


resource "azurerm_key_vault" "lab" {
  name                        = "boathugstheshore"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.lab.name
  rbac_authorization_enabled  = true
  enabled_for_disk_encryption = false
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.lab.name
  location            = var.location
  address_space       = var.address_space
  address_prefixes    = var.address_prefixes
}

resource "azurerm_resource_group_policy_assignment" "lab" {
  name                 = "resource_policy"
  resource_group_id    = azurerm_resource_group.lab.id
  policy_definition_id = data.azurerm_policy_definition.lab.id
}

resource "azurerm_security_center_subscription_pricing" "lab" {
  tier          = "Standard"
  resource_type = "KeyVaults"
  subplan       = "PerKeyVault"
}