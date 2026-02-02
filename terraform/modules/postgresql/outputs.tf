output "server_fqdn" {
  description = "PostgreSQL server FQDN"
  value       = azurerm_postgresql_flexible_server.postgres.fqdn
}

output "database_name" {
  description = "Database name"
  value       = azurerm_postgresql_flexible_server_database.reddit_db.name
}

output "server_id" {
  description = "PostgreSQL server ID"
  value       = azurerm_postgresql_flexible_server.postgres.id
}

output "admin_username" {
  description = "Admin username"
  value       = azurerm_postgresql_flexible_server.postgres.administrator_login
  sensitive   = true
}