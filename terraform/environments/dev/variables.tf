variable "location" {
  type    = string
  default = "centralindia"
}
variable "rg" {
  type = object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  })
}

variable "network" {
  type = object({
    vnet_name             = string
    resource_group_name   = string
    location              = string
    vnet_address_space    = list(string)
    subnet_name           = string
    subnet_address_prefix = list(string)
    tags                  = optional(map(string), {})
  })
}
variable "acr" {
  type = object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    admin_enabled       = bool
    tags                = optional(map(string), {})
  })
}

variable "aks" {
  type = object({
    name               = string
    kubernetes_version = string
    dns_prefix         = string

    default_node_pool = object({
      vm_size    = string
      node_count = number
    })

    network_profile = object({
      service_cidr   = string
      dns_service_ip = string
    })
  })
}

variable "aks_identity" {
  type = object({
    name = string
  })
  description = "User-assigned managed identity for AKS cluster"
}