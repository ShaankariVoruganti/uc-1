module "resource_group" {
  source                      = "./modules/resource-groups/primary_resource_group"
  primary_resource_group_name = var.primary_resource_group_name
  primary_location            = var.primary_location
  prevent_dlt                 = var.prevent_dlt
}

module "primary_vnet" {
  source                      = "./modules/network/primary_vnet"
  primary_resource_group_name = module.resource_group.primary_resource_group_name
  primary_location            = var.primary_location
  primary_vnet                = var.primary_vnet
  primary_vnet_addr           = var.primary_vnet_addr
  primary_subnet              = var.primary_subnet
  primary_subnet_addr         = var.primary_subnet_addr
  primary_bastion_subnet      = var.primary_bastion_subnet
  primary_bastion_addr        = var.primary_bastion_addr
  primary_bastion_pip_name    = var.primary_bastion_pip_name
  bastion-all-method          = var.bastion-all-method
  bastion-sku                 = var.bastion-sku
  bastion-host                = var.bastion-host
  bastion-ip-config           = var.bastion-ip-config
  primary_nsg                 = var.primary_nsg
  rdp_rule                    = var.rdp_rule
  priority1                   = var.priority1
  direction                   = var.direction
  access                      = var.access
  protocol1                   = var.protocol1
  source_port                 = var.source_port
  destination_port            = var.destination_port
  source_addr_prefix          = var.source_addr_prefix
  destination_addr_prefix     = var.destination_addr_prefix
  mssql_rule                  = var.mssql_rule
  priority2                   = var.priority2
  protocol2                   = var.protocol2
  mssql_destination_port      = var.mssql_destination_port
  vm1_pip                     = var.vm1_pip
  vm1_pip_alloc               = var.vm1_pip_alloc
  nic1                        = var.nic1
  ipconfig1                   = var.ipconfig1
  private_ip_alloc1           = var.private_ip_alloc1
  domain_name1                = var.domain_name1
}

module "secondary_resource_group"{
  source                        = "./modules/resource-groups/secondary_resource_group"
  secondary_resource_group_name = var.secondary_resource_group_name
  secondary_location            = var.secondary_location
}

module "secondary_vnet" {
  source                        = "./modules/network/secondary_vnet"
  secondary_resource_group_name = module.secondary_resource_group.secondary_resource_group_name
  secondary_location            = var.secondary_location
  secondary_vnet                = var.secondary_vnet
  secondary_vnet_addr           = var.secondary_vnet_addr
  secondary_subnet              = var.secondary_subnet
  secondary_subnet_addr         = var.secondary_subnet_addr
  secondary_nsg                 = var.secondary_nsg
  rdp_rule                      = var.rdp_rule
  priority3                     = var.priority3
  direction                     = var.direction
  access                        = var.access
  protocol1                     = var.protocol1
  source_port                   = var.source_port
  destination_port              = var.destination_port
  source_addr_prefix            = var.source_addr_prefix
  destination_addr_prefix       = var.destination_addr_prefix
  mssql_rule                    = var.mssql_rule
  priority4                     = var.priority4
  protocol2                     = var.protocol2
  mssql_destination_port        = var.mssql_destination_port
  vm2_pip                       = var.vm2_pip
  vm2_pip_alloc                 = var.vm2_pip_alloc
  nic2                          = var.nic2
  ipconfig2                     = var.ipconfig2
  private_ip_alloc2             = var.private_ip_alloc2 
  domain_name2                  = var.domain_name2
}

module "primary_peering"{
  source                        ="./modules/network/primary_peering"
  primary_resource_group_name   = module.resource_group.primary_resource_group_name
  primary_vnet_name             = var.primary_vnet
  primary_peer_name             = var.primary_peer_name
  secondary_vnet_id             = module.secondary_vnet.secondary_vnet_id
}

module "secondary_peering"{
  source                                = "./modules/network/secondary_peering"
  secondary_resource_group_name         = module.secondary_resource_group.secondary_resource_group_name
  secondary_vnet_name                   = var.secondary_vnet
  secondary_peer_name                   = var.secondary_peer_name
  primary_vnet_id                       = module.primary_vnet.primary_vnet_id
}

module "primary_vms"{
  source                                = "./modules/compute/primary_vms"
  primary_vm                            = var.primary_vm
  primary_location                      = var.primary_location
  primary_resource_group_name           = var.primary_resource_group_name
  network_if_id1                        = [module.primary_vnet.network_if_id1]
  primary_vm_size                       = var.primary_vm_size
  image_publisher                       = var.image_publisher
  image_offer                           = var.image_offer
  image_sku                             = var.image_sku
  image_version                         = var.image_version
  OSdisk1_name                          = var.OSdisk1_name
  OSdisk_caching                        = var.OSdisk_caching
  OS_create_option                      = var.OS_create_option
  OS_managed_disk_type                  = var.OS_managed_disk_type
  vm1_name                              = var.vm1_name
  vm1_admin_username                    = var.vm1_admin_username
  vm1_admin_password                    = var.vm1_admin_password
  vm_timezone                           = var.vm_timezone
  vm_agent                              = var.vm_agent
  auto_upgrades                         = var.auto_upgrades
  sql_conn_type                         = var.sql_conn_type
  sql1_password                         = var.sql1_password
  sql1_username                         = var.sql1_username
}

module "secondary_vms"{
  source                                = "./modules/compute/secondary_vms"
  secondary_vm                          = var.secondary_vm
  secondary_location                    = var.secondary_location
  secondary_resource_group_name         = var.secondary_resource_group_name
  network_if_id2                        = [module.secondary_vnet.network_if_id2]
  secondary_vm_size                     = var.secondary_vm_size
  image_publisher                       = var.image_publisher
  image_offer                           = var.image_offer
  image_sku                             = var.image_sku
  image_version                         = var.image_version
  OSdisk2_name                          = var.OSdisk2_name
  OSdisk_caching                        = var.OSdisk_caching
  OS_create_option                      = var.OS_create_option
  OS_managed_disk_type                  = var.OS_managed_disk_type
  vm2_name                              = var.vm2_name
  vm2_admin_username                    = var.vm2_admin_username
  vm2_admin_password                    = var.vm2_admin_password
  vm_timezone                           = var.vm_timezone
  vm_agent                              = var.vm_agent
  auto_upgrades                         = var.auto_upgrades
  sql_conn_type                         = var.sql_conn_type
  sql2_password                         = var.sql2_password
  sql2_username                         = var.sql2_username
}

module "primary_security" {
  source = "./modules/Security/primary_security"
  primary_resource_group_name           = module.resource_group.primary_resource_group_name
  primary_location                      = var.primary_location
  primary_key_vault_name                = var.primary_key_vault_name
  soft_delete_retention_days            = var.soft_delete_retention_days
  purge_protection_enabled              = var.purge_protection_enabled
  sku_name                              = var.sku_name
  key_permissions                       = var.key_permissions
  secret_permissions                    = var.secret_permissions
  storage_permissions                   = var.storage_permissions
  secret1_name                          = var.secret1_name
  secret1_value                         = var.secret1_value
  secret2_name                          = var.secret2_name
  secret2_value                         = var.secret2_value
  secret3_name                          = var.secret3_name
  secret3_value                         = var.secret3_value
  secret4_name                          = var.secret4_name
  secret4_value                         = var.secret4_value
  object_id                             = var.object_id 
}

module "secondary_security" {
  source = "./modules/Security/secondary_security"
  secondary_resource_group_name         = module.secondary_resource_group.secondary_resource_group_name
  secondary_location                    = var.secondary_location
  secondary_key_vault_name              = var.secondary_key_vault_name
  soft_delete_retention_days            = var.soft_delete_retention_days
  purge_protection_enabled              = var.purge_protection_enabled
  sku_name                              = var.sku_name
  key_permissions                       = var.key_permissions
  secret_permissions                    = var.secret_permissions
  storage_permissions                   = var.storage_permissions
  secret1_name                          = var.secret1_name
  secret1_value                         = var.secret1_value
  secret2_name                          = var.secret2_name
  secret2_value                         = var.secret2_value
  secret3_name                          = var.secret3_name
  secret3_value                         = var.secret3_value
  secret4_name                          = var.secret4_name
  secret4_value                         = var.secret4_value
  object_id                             = var.object_id  
}

module "ManagementGroup" {
  source                                = "./modules/ManagementGroup"
  display_name                          = var.display_name
}
module "traffic_manager_rg"{
  source                        = "./modules/resource-groups/traffic_manager_rg"
  tf_resource_group_name        = var.tf_resource_group_name
  tf_location                   = var.tf_location
} 
module "traffic_manager_profile" {
  source                                = "./modules/traffic-manager/traffic_manager_profile"
  traffic_manager                       = var.traffic_manager
  primary_resource_group_name           = module.traffic_manager_rg.tf_resource_group_name
  routing_method                        = var.routing_method
  dns_name                              = var.dns_name
  ttl                                   = var.ttl
  tm_protocol                           = var.tm_protocol
  tm_port                               = var.tm_port
  tm_path                               = var.tm_path
  tm_interval                           = var.tm_interval
  tm_timeout                            = var.tm_timeout
  failure_num                           = var.failure_num
  tag                                   = var.tag

}

module "traffic_manager_endpoint" {
  source                                = "./modules/traffic-manager/traffic_manager_endpoint"
  endpoint1_name                        = var.endpoint1_name
  traffic_manager_profile_id            = module.traffic_manager_profile.traffic_manager_profile_id
  weight1                               = var.weight1
  pip1_id                               = module.primary_vnet.pip1_id

  endpoint2_name                        = var.endpoint2_name
  weight2                               = var.weight2
  pip2_id                               = module.secondary_vnet.pip2_id


}
