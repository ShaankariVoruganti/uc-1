resource "azurerm_traffic_manager_profile" "example" {
  name                   = var.traffic_manager
  resource_group_name    = var.primary_resource_group_name
  traffic_routing_method = var.routing_method

  dns_config {
    relative_name = var.dns_name
    ttl           = var.ttl
  }

  monitor_config {
    protocol                     = var.tm_protocol
    port                         = var.tm_port
    path                         = var.tm_path
    interval_in_seconds          = var.tm_interval
    timeout_in_seconds           = var.tm_timeout
    tolerated_number_of_failures = var.failure_num
  }

  tags = {
    environment = var.tag
  }
}


