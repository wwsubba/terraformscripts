
#Create KeyVault ID
resource "random_id" "kvname" {
  byte_length = 7
  prefix = "keyvault"
}

data "azuread_client_config" "current" {}

resource "azurerm_key_vault" "kv1" {
 name                        = random_id.kvname.hex
  location                    = "East US"
  resource_group_name         = "WW-CloudServiceManagement-RG-TBDNov30"
  tenant_id = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {

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
