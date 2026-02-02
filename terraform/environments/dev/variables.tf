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

variable "keyvault" {
  type = object({
    name     = string
    sku_name = string
  })
}

variable "postgresql" {
  type = object({
    name                  = string
    version               = string
    administrator_login       = string
    administrator_password        = string
    storage_mb            = number
    sku_name              = string
    backup_retention_days = number
    database_name         = string
    tags                  = optional(map(string), {})
  })
}

variable "postgresql_admin_password" {
  type        = string
  sensitive   = true
  description = "PostgreSQL admin password"
}