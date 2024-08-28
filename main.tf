terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 0.13"
}

provider "azurerm" {
  features {}
}
resource "azurerm_virtual_hub_connection" "vhub_connection" {
  name                      = var.connection_name
  virtual_hub_id            = var.vhub_id
  remote_virtual_network_id = var.remote_vnetwork_id
  internet_security_enabled = var.internet_security_enabled

  dynamic "routing" {
    for_each = var.routing
    content {
      associated_route_table_id = routing.value.associated_route_table_id
      inbound_route_map_id      = routing.value.inbound_route_map_id
      outbound_route_map_id     = routing.value.outbound_route_map_id

      dynamic "propagated_route_table" {
        for_each = routing.value.propagated_route_table

        content {
          labels          = propagated_route_table.value.labels
          route_table_ids = propagated_route_table.value.route_table_ids
        }
      }

      static_vnet_local_route_override_criteria = routing.value.static_vnet_local_route_override_criteria

      dynamic "static_vnet_route" {
        for_each = routing.value.static_vnet_route

        content {
          name                = static_vnet_route.value.connection_name
          address_prefixes    = static_vnet_route.value.address_prefixes
          next_hop_ip_address = static_vnet_route.value.next_hop_ip_address
        }
      }
    }
  }
}
