variable "secondary_resource_group_name" {
  description = "Name of the Azure Resource Group"
}
variable "secondary_location" {
  description = "Azure region for the Resource Group"
}
variable secondary_vm{}
variable secondary_vm_size {}
variable image_publisher{}
variable image_offer{}
variable image_sku{}
variable image_version{}
variable OSdisk2_name{}
variable OSdisk_caching{}
variable OS_create_option{}
variable OS_managed_disk_type{}
variable network_if_id2{}
variable vm2_name{}
variable vm2_admin_username{}
variable vm2_admin_password{}
variable vm_timezone{}
variable vm_agent{}
variable auto_upgrades{}
variable sql_conn_type{}
variable sql2_password{}
variable sql2_username{}