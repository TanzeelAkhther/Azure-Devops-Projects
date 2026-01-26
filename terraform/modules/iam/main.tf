resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = var.iam.aks_principal_id
  scope                = var.iam.acr_id
  role_definition_name = var.iam.role_name
}
