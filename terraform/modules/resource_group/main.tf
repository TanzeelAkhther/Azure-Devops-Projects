resource "azurerm_resource_group" "aks_rg" {
  name     = var.rg.name
  location = var.rg.location
  tags = var.rg.tags
}