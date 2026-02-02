output "resource_group_name" {
  description = "Name of the resource group for Terraform backend"
  value       = azurerm_resource_group.tf-state.name
}

output "storage_account_name" {
  description = "Name of the storage account for Terraform backend"
  value       = azurerm_storage_account.backend-storage.name
}

output "container_name" {
  description = "Name of the storage container for Terraform state"
  value       = azurerm_storage_container.tfstate-container.name
}

output "backend_config" {
  description = "Backend configuration block for Terraform (use this in backend.tf)"
  value = {
    resource_group_name  = azurerm_resource_group.tf-state.name
    storage_account_name = azurerm_storage_account.backend-storage.name
    container_name       = azurerm_storage_container.tfstate-container.name
  }
}

