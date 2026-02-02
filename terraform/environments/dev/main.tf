module "rg" {
  source = "../../modules/resource_group"
  rg     = var.rg
}

module "network" {
  source = "../../modules/network"
  network = {
    vnet_name             = var.network.vnet_name
    resource_group_name = var.network.resource_group_name
    location              = var.network.location
    vnet_address_space = var.network.vnet_address_space
    subnet_name           = var.network.subnet_name
    subnet_address_prefix = var.network.subnet_address_prefix
    tags = var.network.tags
  }
}

module "acr" {
  source = "../../modules/acr"
  acr    = var.acr
}

module "aks" {
  source = "../../modules/aks"

  aks = {
    name                = var.aks.name
    location            = var.location
    resource_group_name = var.rg.name
    dns_prefix          = var.aks.dns_prefix
    kubernetes_version  = var.aks.kubernetes_version

    oidc_issuer_enabled       = true
    workload_identity_enabled = true
    identity_type             = "SystemAssigned"

    default_node_pool = {
      name           = "system"
      node_count     = var.aks.default_node_pool.node_count
      vm_size        = var.aks.default_node_pool.vm_size
      vnet_subnet_id = module.network.aks_subnet_id
    }

    network_profile = {
      network_plugin = "azure"
      service_cidr   = var.aks.network_profile.service_cidr
      dns_service_ip = var.aks.network_profile.dns_service_ip
    }

    tags = var.rg.tags
  }
}
