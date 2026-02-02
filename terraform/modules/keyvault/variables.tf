variable "keyvault" {
  type = object({
    name                     = string
    location                 = string
    resource_group_name      = string
    sku_name                 = string
    tenant_id                = string
    purge_protection_enabled = bool
  })
}

variable "postgresql_admin_password" {
  type        = string
  sensitive   = true
  default     = null
  description = "PostgreSQL admin password to store in Key Vault"
}

variable "terraform_object_id" {
  type        = string
  description = "Object ID of the service principal running Terraform"
}