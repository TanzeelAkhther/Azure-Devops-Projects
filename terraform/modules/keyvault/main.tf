resource "azurerm_key_vault" "keyvault" {
  name                     = var.keyvault.name
  location                 = var.keyvault.location
  resource_group_name      = var.keyvault.resource_group_name
  sku_name                 = var.keyvault.sku_name
  tenant_id                = var.keyvault.tenant_id
  purge_protection_enabled = true
}

# Secret for PostgreSQL password
resource "azurerm_key_vault_secret" "postgres_password" {
  count        = var.postgresql_admin_password != null ? 1 : 0
  name         = "postgres-admin-password"
  value        = var.postgresql_admin_password
  key_vault_id = azurerm_key_vault.keyvault.id
}

# Access policy for Terraform to write secrets
resource "azurerm_key_vault_access_policy" "terraform" {
  key_vault_id = azurerm_key_vault.keyvault.id
  tenant_id    = var.keyvault.tenant_id
  object_id    = var.terraform_object_id

  secret_permissions = [
    "Get", "List", "Set", "Delete", "Purge"
  ]
}