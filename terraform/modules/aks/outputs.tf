output "identity_principal_id" {
  value = azurerm_kubernetes_cluster.dev_cluster.identity[0].principal_id
}

output "id" {
    value = azurerm_kubernetes_cluster.dev_cluster.id
}