resource "azurerm_resource_group" "aks_rg" {
  name     = "rg-aks-dev"
  location = "centralindia"
  tags = {
    environment = "dev"
  }
}
