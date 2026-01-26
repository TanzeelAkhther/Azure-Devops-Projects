resource "azurerm_resource_group" "tf-state" {
  name     = "terraform-backend-rg"
  location = "centralindia"
}

resource "azurerm_storage_account" "backend-storage" {
  name                     = "tfbackend7z"
  resource_group_name      = azurerm_resource_group.tf-state.name
  location                 = azurerm_resource_group.tf-state.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "dev"
  }
}


resource "azurerm_storage_container" "tfstate-container" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.backend-storage.id
  container_access_type = "private"
}
