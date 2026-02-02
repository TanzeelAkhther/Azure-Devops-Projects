output "key_vault_id" {
  value = azurerm_key_vault.keyvault.id
}

output "postgres_password_secret_id" {
  value = try(azurerm_key_vault_secret.postgres_password[0].id, null)
}