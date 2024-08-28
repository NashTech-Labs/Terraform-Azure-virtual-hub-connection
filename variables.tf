variable "connection_name" {
  description = "Name of the virtual hub connection resource"
  type        = string
}

variable "vhub_id" {
  description = "Virtual Hub Id"
  type        = string
}

variable "remote_vnetwork_id" {
  description = "The ID of the Virtual Network which the Virtual Hub should be connected to"
  type        = string
}

variable "internet_security_enabled" {
  description = "virtual hub connection internet security enabled"
  type = bool
}

variable "routing" {
  description = "virtual hub connection routing"
  type = list(object({
    associated_route_table_id = optional(string)
    inbound_route_map_id      = optional(string)
    outbound_route_map_id     = optional(string)
    propagated_route_table = optional(list(object({
      labels          = optional(list(string))
      route_table_ids = optional(list(string))
    })), [])
    static_vnet_local_route_override_criteria = optional(string)
    static_vnet_route = optional(list(object({
      name                = optional(string)
      address_prefixes    = optional(list(string))
      next_hop_ip_address = optional(string)
    })), [])
  }))
}
