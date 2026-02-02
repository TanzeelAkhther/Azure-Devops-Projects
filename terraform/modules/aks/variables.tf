variable "aks" {
  type = object({
    name                      = string
    location                  = string
    resource_group_name       = string
    dns_prefix                = string
    kubernetes_version        = string
    oidc_issuer_enabled       = bool
    workload_identity_enabled = bool

    default_node_pool = object({
      name           = string
      node_count     = number
      vm_size        = string
      vnet_subnet_id = string
    })

    identity_type = string

    network_profile = object({
      network_plugin = string
      service_cidr   = string
      dns_service_ip = string
    })

    tags = optional(map(string), {})
  })
}
