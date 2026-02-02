output "id" {
  value = azurerm_container_registry.acr.id
}

output "resource_id" {
  description = "Resource ID of the Azure Container Registry"
  value       = azurerm_container_registry.acr.id
}