variable "primary_resource_group_name" {
  description = "Name of the Azure Resource Group"
}
variable "primary_peer_name" {
  type = string
}
variable "primary_vnet_name" {
type=string
description = "Name of the Virtual Network"
}
variable "secondary_vnet_id" {}