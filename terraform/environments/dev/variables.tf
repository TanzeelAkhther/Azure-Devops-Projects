variable "environment" {
  type = string
}

variable "location" {
  type = string
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
    resource_group_name = string
    location            = string

    vnet = object({
      name          = string
      address_space = list(string)
    })

    subnet = object({
      name   = string
      prefix = string
    })
  })
}

variable "acr" {
  type = object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = optional(string, "Basic")
    admin_enabled       = optional(bool, true)
    tags                = optional(map(string), {})
  })
}

variable "aks" {
  type = object({
    name                = string
    resource_group_name = string
    location            = string
    kubernetes_version  = string
    dns_prefix          = string

    default_node_pool = object({
      vm_size    = string
      node_count = number
      subnet_id  = string
    })

    network_profile = object({
      service_cidr   = string
      dns_service_ip = string
    })

    tags = optional(map(string), {})
  })
}
