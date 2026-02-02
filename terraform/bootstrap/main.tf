resource "azurerm_resource_group" "tf-state" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_storage_account" "backend-storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.tf-state.name
  location                 = azurerm_resource_group.tf-state.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  
  # Security best practices
  min_tls_version                = "TLS1_2"
  allow_nested_items_to_be_public = false
  https_traffic_only_enabled      = true
  
  # Network rules - allow access from all networks by default
  # You can restrict this later if needed
  public_network_access_enabled = true

  tags = var.tags
}

resource "azurerm_storage_container" "tfstate-container" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.backend-storage.id
  container_access_type = "private"
}
