primary_resource_group_name            =  "primary-rg"
primary_location                       =  "UK South"
primary_vnet                           =  "primary-vnet"
primary_vnet_addr                      =  ["10.0.0.0/16"]
primary_subnet                         =  "primary-subnet"
primary_subnet_addr                    =  ["10.0.1.0/24"]
primary_bastion_subnet                 =  "AzureBastionSubnet"
primary_bastion_addr                   =  ["10.0.2.0/24"]
primary_bastion_pip_name               =  "bastion-ip"
bastion-all-method                     =  "Static"
bastion-sku                            =  "Standard"
bastion-host                           =  "bastion-host"
bastion-ip-config                      =  "configuration"
primary_peer_name                      =  "peering1"
primary_nsg                            =  "nsg1"
rdp_rule                               =  "RDPrule"
priority1                              =  1000
direction                              =  "Inbound"
access                                 =  "Allow"
protocol1                              = "Tcp"
source_port                            = "*"
destination_port                       = 3389
source_addr_prefix                     = "167.220.255.0/25"
destination_addr_prefix                = "*"
mssql_rule                             = "MSSQLRule"
priority2                              = 1001
protocol2                              = "Tcp"
mssql_destination_port                 = 1433
nic1                                   = "test-NIC1"
ipconfig1                              = "ip1"
private_ip_alloc1                      = "Dynamic"
vm1_pip_alloc                          = "Dynamic"
domain_name1                           = "vm1-dns"  

secondary_resource_group_name          =  "secondary-rg"
secondary_location                     =  "north europe"
secondary_vnet                         =  "secondary-vnet"
secondary_vnet_addr                    =  ["20.0.0.0/16"] 
secondary_subnet                       =  "secondary-subnet"
secondary_subnet_addr                  =  ["20.0.1.0/24"]
secondary_peer_name                    =  "peering2"
secondary_nsg                          =  "nsg2"
priority3                              =  1003
priority4                              =  1004
nic2                                   = "test-NIC2"
ipconfig2                              = "ip2"
private_ip_alloc2                      = "Dynamic"
vm2_pip_alloc                          = "Dynamic"
domain_name2                           = "vm2-dns"

primary_vm                             = "vm-1"
primary_vm_size                        = "Standard_D2S_v3"
image_publisher                        = "MicrosoftSQLServer"
image_offer                            = "SQL2019-WS2019"
image_sku                              = "SQLDEV"
image_version                          = "latest"
OSdisk1_name                           = "test-OS1Disk"
OSdisk_caching                         = "ReadOnly"
OS_create_option                       = "FromImage"
OS_managed_disk_type                   = "Premium_LRS"
vm1_pip = "pip1"
vm1_name                               = "host01"
vm1_admin_username                     = "vmadmin1"
vm1_admin_password                     = "Password1234!"
vm_timezone                            = "Pacific Standard Time"
vm_agent                               = true
auto_upgrades                          = true
sql_conn_type                          = "PUBLIC"
sql1_password                          = "test-pw"
sql1_username                          = "test-un1"

secondary_vm                           = "vm-2"
secondary_vm_size                      = "Standard_D2S_v3"
OSdisk2_name                           = "test-OS2Disk"
vm2_name                               = "host02"
vm2_pip                                = "pip2"
vm2_admin_username                     = "vmadmin2"
vm2_admin_password                     = "Password1234!"
sql2_password                          = "test-pw"
sql2_username                          = "test-un2"

display_name                           =  "parentgroup"

primary_key_vault_name                 =  "primary-keyvault357"
secondary_key_vault_name               =  "secondary-keyvault357"
soft_delete_retention_days             =  7
purge_protection_enabled               =  false
sku_name                               =  "standard"
key_permissions                        =  ["Get",]
secret_permissions                     =  [
      "Get", "Backup", "Delete", "List", "Purge", "Recover", "Restore", "Set",
    ]
storage_permissions                    =  [
      "Get",
    ]
secret1_name                           =  "clientID"
secret1_value                          =  "fbeb3afc-9277-4dd0-9365-75e609acadef"
secret2_name                           =  "clientsecret"
secret2_value                          =  "beJ8Q~Mxh4trEF4zb_QitE-nLY4~EbXDQ6PL4anT"
secret3_name                           =  "tenantID"
secret3_value                          =  "252cffbe-a714-4696-a12b-42b36c3ba3b6"
secret4_name                           =  "subscriptionID"
secret4_value                          =  "0fab4497-0c13-457e-9f55-f42ee26e4303"
object_id                              =  "09d881b5-dd74-46e0-9204-11a597cd180f"

tf_resource_group_name                 = "tf_rg"
tf_location                            = "centralus"
traffic_manager                        =  "stardust"
routing_method                         =  "Performance"
dns_name                               =  "usecase"
ttl                                    =  100
tm_protocol                            =  "HTTP"
tm_port                                =  80
tm_path                                =  "/"
tm_interval                            =  30
tm_timeout                             =  9
failure_num                            =  3
tag                                    =  "traffic-manager"


endpoint1_name                         =  "example-endpoint1"
endpoint2_name                         =  "example-endpoint2"
weight1                                =  100
weight2                                =  200
