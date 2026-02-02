output "identity_principal_id" {
  value = azurerm_kubernetes_cluster.dev_cluster.identity[0].principal_id
}

output "id" {
  value = azurerm_kubernetes_cluster.dev_cluster.id
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.dev_cluster.kube_config_raw
  sensitive = true
}

output "oidc_issuer_url" {
  value = azurerm_kubernetes_cluster.dev_cluster.oidc_issuer_url
}

output "kubelet_identity_object_id" {
  description = "Object ID of the kubelet identity used for role assignments"
  value       = azurerm_kubernetes_cluster.dev_cluster.kubelet_identity[0].object_id
}