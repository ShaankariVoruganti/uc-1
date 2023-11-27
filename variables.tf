variable "primary_resource_group_name" {
  description = "Name of the Azure Resource Group"
}
variable "primary_location" {
  description = "Azure region for the Resource Group"
}
variable "primary_vnet" {
    type = string
    description = ""
}
variable "primary_vnet_addr" {
    type = list(string)
    description = ""
}
variable "primary_subnet" {
    type = string
    description = "(optional) describe your variable"
}
variable "primary_subnet_addr" {
    type = list(string)
    description = "(optional) describe your variable"
}

variable "primary_bastion_subnet" {
    type = string
    description = "(optional) describe your variable"
}
variable "primary_bastion_addr" {
    type = list(string)
    description = "(optional) describe your variable"
}
variable "primary_bastion_pip_name" {
    type = string
    description = "(optional) describe your variable"
}
variable "bastion-all-method" {
    type = string
    description = "(optional) describe your variable"
}
variable "bastion-sku" {
    type = string
    description = "(optional) describe your variable"
}
variable "bastion-host" {
    type = string
    description = "(optional) describe your variable"
}
variable "bastion-ip-config" {
    type = string
    description = "(optional) describe your variable"
}

variable "primary_peer_name" {
  type = string
}

variable "primary_nsg"{
  type = string
  description = "name of the nsg"
}
variable "rdp_rule"{

}
variable "priority1"{

}
variable "direction"{
  
}
variable "access"{
  
}
variable protocol1{

}
variable source_port{

}
variable destination_port{

}
variable source_addr_prefix{}
variable destination_addr_prefix{}
variable domain_name1{}


variable "priority2"{

}
variable protocol2{

}
variable mssql_destination_port{

}
variable vm1_pip{}
variable vm1_pip_alloc{}
variable nic1{}
variable ipconfig1{}
variable private_ip_alloc1{}

variable "secondary_resource_group_name" {
  description = "Name of the Azure Resource Group"
}
variable "secondary_location" {
  description = "Azure region for the Resource Group"
}
variable "secondary_vnet" {
    type = string
    description = ""
}
variable "secondary_vnet_addr" {
    type = list(string)
    description = ""
}
variable "secondary_subnet" {
    type = string
    description = "(optional) describe your variable"
}
variable "secondary_subnet_addr" {
    type = list(string)
    description = "(optional) describe your variable"
}
variable "secondary_peer_name" {
  type = string
}
variable "display_name" {
  type = string
  description = "display name"
}
variable "secondary_nsg"{
  type = string
  description = "name of the nsg"
}
variable "priority3"{

}
variable "mssql_rule"{

}
variable "priority4"{

}
variable vm2_pip{}
variable vm2_pip_alloc{}
variable nic2{}
variable ipconfig2{}
variable private_ip_alloc2{}
variable domain_name2{}

variable primary_vm{}
variable primary_vm_size {}
variable image_publisher{}
variable image_offer{}
variable image_sku{}
variable image_version{}
variable OSdisk1_name{}
variable OSdisk_caching{}
variable OS_create_option{}
variable OS_managed_disk_type{}
variable vm1_name{}
variable vm1_admin_username{}
variable vm1_admin_password{}
variable vm_timezone{}
variable vm_agent{}
variable auto_upgrades{}
variable sql_conn_type{}
variable sql1_password{}
variable sql1_username{}


variable secondary_vm{}
variable secondary_vm_size {}
variable OSdisk2_name{}
variable vm2_name{}
variable vm2_admin_username{}
variable vm2_admin_password{}
variable sql2_password{}
variable sql2_username{}

variable "primary_key_vault_name" {
   description = "name of your keyvault"
   type = string
}
variable "secondary_key_vault_name"{
   description = "name of your keyvault"
   type = string
}
variable "soft_delete_retention_days" {
    description = "soft delete retention days"
    type = number
}
variable "purge_protection_enabled" {
    description = "enabled"
    type = bool
}
variable "sku_name" {
    description = "name of your sku"
    type = string
}
variable "key_permissions" {
    description = "key permissions"
    type = list(string)
}
variable "secret_permissions" {
    description = "secret permissions"
    type = list(string)
}
variable "storage_permissions" {
    description = "storage permissions"
    type = list(string)
}
variable "secret1_name" {
    description = "secret1_name"
    type = string
}
variable "secret1_value" {
    description = "secret1_value"
    type = string
}
variable "secret2_name" {
    description = "secret2_name"
    type = string
}
variable "secret2_value" {
    description = "secret2_value"
    type = string
}
variable "secret3_name" {
    description = "secret3_name"
    type = string
}
variable "secret3_value" {
    description = "secret3_value"
    type = string
}
variable "secret4_name" {
    description = "secret4_name"
    type = string
}
variable "secret4_value" {
    description = "secret4_value"
    type = string
}
variable "object_id" {
    description = "object_id"
    type = string
}

variable tf_resource_group_name{}
variable tf_location{}

variable traffic_manager{}
variable routing_method{}
variable dns_name{}
variable ttl{}
variable tm_protocol{}
variable tm_port{}
variable tm_path{}
variable tm_interval{}
variable tm_timeout{}
variable failure_num{}
variable tag{}

variable endpoint1_name{}
variable weight1{}
variable endpoint2_name{}
variable weight2{}
