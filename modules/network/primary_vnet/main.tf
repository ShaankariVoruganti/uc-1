
resource "azurerm_virtual_network" "primary_vnet" {
  name                = var.primary_vnet
  address_space       = var.primary_vnet_addr
  location            = var.primary_location
  resource_group_name = var.primary_resource_group_name
}

resource "azurerm_subnet" "primary_subnet" {
  name                 = var.primary_subnet
  resource_group_name  = var.primary_resource_group_name
  virtual_network_name = azurerm_virtual_network.primary_vnet.name
  address_prefixes     = var.primary_subnet_addr
}

resource "azurerm_subnet" "primary_bastion_subnet" {
  name                 = var.primary_bastion_subnet
  resource_group_name  = var.primary_resource_group_name
  virtual_network_name = azurerm_virtual_network.primary_vnet.name
  address_prefixes     = var.primary_bastion_addr
}

resource "azurerm_public_ip" "primary_bastion_pip" {
  name                = var.primary_bastion_pip_name
  resource_group_name  = var.primary_resource_group_name
  location            = var.primary_location
  allocation_method   = var.bastion-all-method
  sku                 = var.bastion-sku
}

resource "azurerm_bastion_host" "bastion-host" {
  name                = var.bastion-host
  location            = var.primary_location
  resource_group_name = var.primary_resource_group_name
  ip_configuration {
    name                 = var.bastion-ip-config
    subnet_id            = azurerm_subnet.primary_bastion_subnet.id
    public_ip_address_id = azurerm_public_ip.primary_bastion_pip.id
  }
}

resource "azurerm_network_security_group" "sqlnsg" {
  name                = var.primary_nsg
  location            = var.primary_location
  resource_group_name = var.primary_resource_group_name
}

resource "azurerm_network_security_rule" "RDPRule" {
  name                        = var.rdp_rule
  resource_group_name         = var.primary_resource_group_name
  priority                    = var.priority1
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
  resource_group_name         = var.primary_resource_group_name
  priority                    = var.priority2
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
  name                = var.vm1_pip
  location            = var.primary_location
  resource_group_name = var.primary_resource_group_name
  allocation_method   = var.vm1_pip_alloc
  domain_name_label   = var.domain_name1
}

resource "azurerm_network_interface" "sqlnic" {
  name                = var.nic1
  location            = var.primary_location
  resource_group_name = var.primary_resource_group_name

  ip_configuration {
    name                          = var.ipconfig1
    subnet_id                     = azurerm_subnet.primary_subnet.id
    private_ip_address_allocation = var.private_ip_alloc1
    public_ip_address_id          = azurerm_public_ip.vm.id
  }
}

resource "azurerm_network_interface_security_group_association" "sqlnsggroup" {
  network_interface_id      = azurerm_network_interface.sqlnic.id
  network_security_group_id = azurerm_network_security_group.sqlnsg.id
}