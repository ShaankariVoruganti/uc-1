resource "azurerm_virtual_network_peering" "primary_peering" {
  name                         = var.primary_peer_name
  resource_group_name         = var.primary_resource_group_name
  virtual_network_name          = var.primary_vnet_name
  remote_virtual_network_id    = var.secondary_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}
