variable "secondary_resource_group_name" {
  description = "Name of the Azure Resource Group"
}
variable "secondary_peer_name" {
  type = string
}
variable "secondary_vnet_name" {
type=string
description = "Name of the Virtual Network"
}
variable "primary_vnet_id" {}