resource "azurerm_user_assigned_identity" "iam" {
  name                = var.iam.name
  resource_group_name = var.iam.resource_group_name
  location            = var.iam.location
}
