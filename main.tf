terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


#Create KeyVault ID
resource "random_id" "kvname" {
  byte_length = 5
  prefix = "keyvault"
}

data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "kv1" {
 name                        = "examplekeyvault"
  location                    = "East US"
  resource_group_name         = "WW-CloudServiceManagement-RG-TBDNov30"
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}
