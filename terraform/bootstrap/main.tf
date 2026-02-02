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
  tags = var.tags
}

resource "azurerm_storage_container" "tfstate-container" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.backend-storage.id
  container_access_type = "private"
}
