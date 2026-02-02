variable "location" {
  type        = string
  default     = "centralindia"
  description = "Azure region for the Terraform backend resources"
}

variable "resource_group_name" {
  type        = string
  default     = "terraform-backend-rg"
  description = "Name of the resource group for Terraform backend"
}

variable "storage_account_name" {
  type        = string
  default     = "tfbackend7z"
  description = "Name of the storage account for Terraform backend (must be globally unique, 3-24 characters, lowercase alphanumeric)"
}

variable "container_name" {
  type        = string
  default     = "tfstate"
  description = "Name of the storage container for Terraform state files"
}

variable "tags" {
  type        = map(string)
  default     = { environment = "dev" }
  description = "Tags to apply to the resources"
}

