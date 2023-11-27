variable "secondary_resource_group_name" {
type=string
  description = "Name of the Azure Resource Group"
}
variable "secondary_location" {
type=string
  description = "Azure region for the Resource Group"
}
variable "secondary_vnet" {
 type=string
description = "Name of the Virtual Network"
}

variable "secondary_vnet_addr" {
  description = "Address space for the Virtual Network"
  type        = list(string)
}
#variable "secondary_vnet_id"{}
variable "secondary_subnet" {
type=string
description = "Name of the Subnet"
}

variable "secondary_subnet_addr" {
  description = "Address space for the Subnet"
  type        = list(string)
}
variable "secondary_nsg"{
  type = string
  description = "name of the nsg"
}

variable "rdp_rule"{

}
variable "priority3"{

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
variable "mssql_rule"{

}
variable "priority4"{

}
variable protocol2{

}
variable mssql_destination_port{

}
variable vm2_pip{}
variable vm2_pip_alloc{}
variable nic2{}
variable ipconfig2{}
variable private_ip_alloc2{}
variable domain_name2{}