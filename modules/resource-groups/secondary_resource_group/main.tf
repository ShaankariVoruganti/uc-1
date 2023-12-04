resource "azurerm_resource_group" "secondary_rg" {
  name     = var.secondary_resource_group_name
  location = var.secondary_location
  prevent_deletion_if_contains_resources = var.prevent_dlt
}
