
resource "azurerm_resource_group" "primary_rg" {
  name     = var.primary_resource_group_name
  location = var.primary_location
}

