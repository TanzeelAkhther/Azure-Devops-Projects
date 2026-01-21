resource "azurerm_resource_group" "aks_rg" {
  name     = "rg-aks-dev"
  location = "centralindia"
  tags = {
    environment = "dev"
  }
}

resource "azurerm_container_registry" "acr" {
  name                = "acakdev09"
  resource_group_name = azurerm_resource_group.aks_rg.name
  sku                 = "Basic"
  location            = azurerm_resource_group.aks_rg.location
  admin_enabled       = true
  tags = {
    environment = "dev"
  }
}

resource "azurerm_virtual_network" "aks_vnet" {
  name                = "vnet-aks-dev"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  address_space       = ["10.0.0.0/16"]
  tags = {
    environment = "dev"
  }
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "subnet-aks-dev"
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_kubernetes_cluster" "dev_cluster" {
  name                = "aks-dev-cluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "aksdevcluster"
  kubernetes_version  = "1.33.5"
  default_node_pool {
    name           = "defaultaks"
    node_count     = 2
    vm_size        = "Standard_D2s_v3"
    vnet_subnet_id = azurerm_subnet.aks_subnet.id
  }
  identity {
    type = "SystemAssigned"
  }
  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.1.0.0/16"
    dns_service_ip = "10.1.0.10"
  }
  tags = {
    environment = "dev"
  }
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.dev_cluster.identity[0].principal_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.acr.id
}
output "aks_identity" {
  value = azurerm_kubernetes_cluster.dev_cluster.identity[0].principal_id
}
