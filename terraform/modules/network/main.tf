resource "azurerm_virtual_network" "aks_vnet" {
  name                = var.network.vnet_name
  location            = var.network.location
  resource_group_name = var.network.resource_group_name
  address_space       = var.network.vnet_address_space
  tags                = var.network.tags
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = var.network.subnet_name
  resource_group_name  = var.network.resource_group_name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = var.network.subnet_address_prefix
}
