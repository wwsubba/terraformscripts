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
  subscription_id = "81ec4907-9db6-4d56-86d4-d997209d7be6"
  client_id       = "1fba0a80-1c71-4130-aa72-350a9b0b9dc6"
  client_secret   = "OQ88Q~GznSMOiV1cDs5FjYxrN4dXCkRtlV4DFczE"
  tenant_id       = "bdcfaa46-3f69-4dfd-b3f7-c582bdfbb820"
}

data "azuread_client_config" "current" {}

resource "azurerm_key_vault" "example" {
  count                       = 1
  name                        = "examplekeyvault"
  location                    = "East US"
  resource_group_name         = "WW-CloudServiceManagement-RG-TBDNov30"
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  soft_delete_retention_days  = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
}

resource "azurerm_key_vault_secret" "example" {
  name         = "secret-sauce"
  value        = "szechuan"
  key_vault_id = azurerm_key_vault.example.id
}
