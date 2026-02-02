variable "kv" {
  type = object({
    name                     = string
    location                 = string
    resource_group_name      = string
    sku_name                 = string
    tenant_id                = string
    purge_protection_enabled = bool
  })
}
