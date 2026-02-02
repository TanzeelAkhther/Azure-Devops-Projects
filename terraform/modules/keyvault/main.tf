resource "azurerm_key_vault" "kv" {
  name                     = var.kv.name
  location                 = var.kv.location
  resource_group_name      = var.kv.resource_group_name
  sku_name                 = var.kv.sku_name
  tenant_id                = var.kv.tenant_id
  purge_protection_enabled = true
}
