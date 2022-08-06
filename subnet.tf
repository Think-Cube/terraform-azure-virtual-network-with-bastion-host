resource "azurerm_subnet" "main" {
  for_each = "${var.subnet_prefix}"
  resource_group_name  = "${data.azurerm_resource_group.rg.name}"
  virtual_network_name = "${var.environment}-${var.vnet_name}-${var.region}-vnet"
  name                 = each.value["name"]
  address_prefixes     = each.value["ip"]

depends_on = [ azurerm_virtual_network.main ] 
}