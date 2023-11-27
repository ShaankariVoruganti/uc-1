resource "azurerm_virtual_network_peering" "secondary_peering" {
  name                         = var.secondary_peer_name
  resource_group_name         = var.secondary_resource_group_name
  virtual_network_name           = var.secondary_vnet_name
  remote_virtual_network_id    = var.primary_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}