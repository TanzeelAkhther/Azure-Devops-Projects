output "kube_config" {
  value     = module.aks.kube_config
  sensitive = true
}

output "oidc_issuer_url" {
  value = module.aks.oidc_issuer_url
}
