variable "primary_resource_group_name" {
  description = "Name of the Azure Resource Group"
}
variable "primary_location" {
  description = "Azure region for the Resource Group"
}
variable "primary_vnet" {
type=string
description = "Name of the Virtual Network"
}

variable "primary_vnet_addr" {
  description = "Address space for the Virtual Network"
  type        = list(string)
}

variable "primary_subnet" {
type=string
description = "Name of the Subnet"
}

variable "primary_subnet_addr" {
  description = "Address space for the Subnet"
  type        = list(string)
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
variable source_addr_prefix{

}
variable destination_addr_prefix{

}
variable domain_name1{}
variable "mssql_rule"{

}
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