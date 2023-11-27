resource "azurerm_resource_group" "traffic_manager_rg" {
  name     = var.tf_resource_group_name
  location = var.tf_location
}
