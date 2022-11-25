resource "azurerm_key_vault" "kv1" {
  name                        = "testww1"
  location                    = "East US"
  resource_group_name         = "WW-CloudServiceManagement-RG-TBDNov30"
  enabled_for_disk_encryption = true

  tenant_id                  = "bdcfaa46-3f69-4dfd-b3f7-c582bdfbb820"
  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  sku_name = "standard"
}
