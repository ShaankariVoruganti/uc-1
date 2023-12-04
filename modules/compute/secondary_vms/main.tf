resource "azurerm_virtual_machine" "sqlvm" {
  name                  = var.secondary_vm
  location              = var.secondary_location
  resource_group_name   = var.secondary_resource_group_name
  network_interface_ids = var.network_if_id2
  vm_size               = var.secondary_vm_size

  storage_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  storage_os_disk {
    name              = var.OSdisk2_name
    caching           = var.OSdisk_caching
    create_option     = var.OS_create_option
    managed_disk_type = var.OS_managed_disk_type
  }

  os_profile {
    computer_name  = var.vm2_name
    admin_username = var.vm2_admin_username
    admin_password = var.vm2_admin_password
  }


  os_profile_windows_config {
    timezone                  = var.vm_timezone
    provision_vm_agent        = var.vm_agent
    enable_automatic_upgrades = var.auto_upgrades
  }
}

resource "azurerm_mssql_virtual_machine" "sqlvm" {
  virtual_machine_id = azurerm_virtual_machine.sqlvm.id
  sql_connectivity_type=var.sql_conn_type
  sql_connectivity_update_password=var.sql2_password
  sql_connectivity_update_username=var.sql2_username
timeouts{
create="20m"
delete="20m"
}
