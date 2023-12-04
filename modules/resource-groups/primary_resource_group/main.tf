
resource "azurerm_resource_group" "primary_rg" {
  name     = var.primary_resource_group_name
  location = var.primary_location
   prevent_deletion_if_contains_resources = var.prevent_dlt
}

