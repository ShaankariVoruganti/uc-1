variable "primary_resource_group_name" {
  description = "Name of the Azure Resource Group"
}
variable "primary_location" {
  description = "Azure region for the Resource Group"
}
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
variable network_if_id1{}
variable vm1_name{}
variable vm1_admin_username{}
variable vm1_admin_password{}
variable vm_timezone{}
variable vm_agent{}
variable auto_upgrades{}
variable sql_conn_type{}
variable sql1_password{}
variable sql1_username{}