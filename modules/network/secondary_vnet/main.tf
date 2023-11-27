resource "azurerm_virtual_network" "secondary_vnet" {
  name                = var.secondary_vnet
  address_space       = var.secondary_vnet_addr
  location            = var.secondary_location
  resource_group_name = var.secondary_resource_group_name
}

resource "azurerm_subnet" "secondary_subnet" {
  name                 = var.secondary_subnet
  resource_group_name  = var.secondary_resource_group_name
  virtual_network_name = azurerm_virtual_network.secondary_vnet.name
  address_prefixes     = var.secondary_subnet_addr
}

resource "azurerm_network_security_group" "sqlnsg" {
  name                = var.secondary_nsg
  location            = var.secondary_location
  resource_group_name = var.secondary_resource_group_name
}

resource "azurerm_network_security_rule" "RDPRule" {
  name                        = var.rdp_rule
  resource_group_name         = var.secondary_resource_group_name
  priority                    = var.priority3
  direction                   = var.direction
  access                      = var.access
  protocol                    = var.protocol1
  source_port_range           = var.source_port
  destination_port_range      = var.destination_port
  source_address_prefix       = var.source_addr_prefix
  destination_address_prefix  = var.destination_addr_prefix
  network_security_group_name = azurerm_network_security_group.sqlnsg.name
}

resource "azurerm_network_security_rule" "MSSQLRule" {
  name                        = var.mssql_rule
  resource_group_name         = var.secondary_resource_group_name
  priority                    = var.priority4
  direction                   = var.direction
  access                      = var.access
  protocol                    = var.protocol2
  source_port_range           = var.source_port
  destination_port_range      = var.mssql_destination_port
  source_address_prefix       = var.source_addr_prefix
  destination_address_prefix  = var.destination_addr_prefix
  network_security_group_name = azurerm_network_security_group.sqlnsg.name
}

resource "azurerm_public_ip" "vm" {
  name                = var.vm2_pip
  location            = var.secondary_location
  resource_group_name = var.secondary_resource_group_name
  allocation_method   = var.vm2_pip_alloc
  domain_name_label   =  var.domain_name2
}

resource "azurerm_network_interface" "sqlnic" {
  name                = var.nic2
  location            = var.secondary_location
  resource_group_name = var.secondary_resource_group_name

  ip_configuration {
    name                          = var.ipconfig2
    subnet_id                     = azurerm_subnet.secondary_subnet.id
    private_ip_address_allocation = var.private_ip_alloc2
    public_ip_address_id          = azurerm_public_ip.vm.id
  }
}

resource "azurerm_network_interface_security_group_association" "sqlnsggroup" {
  network_interface_id      = azurerm_network_interface.sqlnic.id
  network_security_group_id = azurerm_network_security_group.sqlnsg.id
}