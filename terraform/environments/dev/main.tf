module "rg" {
  source = "../../modules/resource_group"
  rg     = var.rg
}

module "network" {
  source  = "../../modules/network"
  network = var.network
}

module "acr" {
  source = "../../modules/acr"
  acr    = var.acr
}

module "aks" {
  source = "../../modules/aks"

  aks = merge(
    var.aks,
    {
      default_node_pool = merge(
        var.aks.default_node_pool,
        {
          vnet_subnet_id = module.network.aks_subnet_id
        }
      )
    }
  )
}

module "iam" {
  source = "../../modules/iam"
  iam = {
    aks_principal_id = module.aks.aks_principal_id
    acr_id          = module.acr.acr_id
  }
}
