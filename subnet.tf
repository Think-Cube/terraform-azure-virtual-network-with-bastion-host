resource "azurerm_subnet" "main" {
  for_each             = var.subnet_prefix
  resource_group_name  = data.azurerm_resource_group.vnet.name
  virtual_network_name = "${var.environment}-${var.vnet_name}-${var.region}-vnet"
  name                 = each.value["name"]
  address_prefixes     = each.value["ip"]
  service_endpoints    = [for se in lookup(each.value, "service_endpoints", []) : se.service]
  dynamic "delegation" {
    for_each = lookup(each.value, "delegations", [])
    content {
      name = delegation.value.name
      service_delegation {
        name = delegation.value.service_name
        actions = delegation.value.actions
      }
    }
  }
  private_endpoint_network_policies = lookup(each.value, "private_endpoint_network_policies", null) 
  private_link_service_network_policies_enabled = lookup(each.value, "private_link_service_network_policies_enabled", null)    
depends_on = [azurerm_virtual_network.main]
}
