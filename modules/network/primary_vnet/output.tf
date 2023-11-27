output "primary_vnet_id" {
  value = azurerm_virtual_network.primary_vnet.id
}
output "primary_subnet_id" {
  value = azurerm_subnet.primary_subnet.id
}
output "network_if_id1" {
  value = azurerm_network_interface.sqlnic.id
}
output "pip1_id"{
  value = azurerm_public_ip.vm.id
}
