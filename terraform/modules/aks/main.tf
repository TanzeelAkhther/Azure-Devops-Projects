resource "azurerm_kubernetes_cluster" "dev_cluster" {
    name = var.aks.name
    location = var.aks.location
    resource_group_name = var.aks.resource_group_name
    dns_prefix = var.aks.dns_prefix
    kubernetes_version = var.aks.kubernetes_version

    default_node_pool {
      name = var.aks.default_node_pool.name
      node_count = var.aks.default_node_pool.node_count
      vm_size = var.aks.default_node_pool.vm_size
      vnet_subnet_id = var.aks.default_node_pool.vnet_subnet_id
    }

    identity {
        type = var.aks.identity_type
    }

    network_profile {
      network_plugin = var.aks.network_profile.network_plugin
      service_cidr = var.aks.network_profile.service_cidr
      dns_service_ip = var.aks.network_profile.dns_service_ip
    }

    tags = var.aks.tags 
}