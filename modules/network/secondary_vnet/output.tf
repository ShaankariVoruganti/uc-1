output "secondary_vnet_id" {
  value = azurerm_virtual_network.secondary_vnet.id
}
output "secondary_subnet_id" {
  value = azurerm_subnet.secondary_subnet.id
}
output "network_if_id2" {
  value = azurerm_network_interface.sqlnic.id
}
output "pip2_id"{
  value = azurerm_public_ip.vm.id
}
