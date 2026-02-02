variable "postgresql" {
    type = object ({
        name = string
        resource_group_name = string
        location = string
        version = string
        administrator_login = string
        administrator_password = optional (string, null)
        storage_mb = number
        sku_name = string
        backup_retention_days = number
        database_name = string
        tags = map(string)
    })
}

variable "admin_password_override" {
  type        = string
  sensitive   = true
  default     = null
  description = "Override password from external source"
}