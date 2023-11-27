resource "azurerm_virtual_machine" "sqlvm" {
  name                  = var.primary_vm
  location              = var.primary_location
  resource_group_name   = var.primary_resource_group_name
  network_interface_ids = var.network_if_id1
  vm_size               = var.primary_vm_size

  storage_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  storage_os_disk {
    name              = var.OSdisk1_name
    caching           = var.OSdisk_caching
    create_option     = var.OS_create_option
    managed_disk_type = var.OS_managed_disk_type
  }

  os_profile {
    computer_name  = var.vm1_name
    admin_username = var.vm1_admin_username
    admin_password = var.vm1_admin_password
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
  sql_connectivity_update_password=var.sql1_password
  sql_connectivity_update_username=var.sql1_username
}
