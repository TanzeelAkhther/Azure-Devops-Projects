# Azure PostgreSQL Flexible Server
resource "azurerm_postgresql_flexible_server" "postgres" {
  name                   = var.postgresql.name
  resource_group_name    = var.postgresql.resource_group_name
  location               = var.postgresql.location
  version                = var.postgresql.version
  administrator_login    = var.postgresql.administrator_login
  administrator_password = coalesce(var.admin_password_override, var.postgresql.administrator_password)
  
  storage_mb = var.postgresql.storage_mb
  sku_name   = var.postgresql.sku_name
  
  backup_retention_days = var.postgresql.backup_retention_days
  
  tags = var.postgresql.tags
}

# Database creation
resource "azurerm_postgresql_flexible_server_database" "reddit_db" {
  name      = var.postgresql.database_name
  server_id = azurerm_postgresql_flexible_server.postgres.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}

# Firewall rule - Allow Azure services
resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_azure" {
  name             = "allow-azure-services"
  server_id        = azurerm_postgresql_flexible_server.postgres.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}