resource "azurerm_virtual_network" "main" {
  name                = "${var.environment}-${var.vnet_name}-${var.region}-vnet"
  location            = data.azurerm_resource_group.vnet.location
  resource_group_name = data.azurerm_resource_group.vnet.name
  address_space       = ["${var.vnet_address_space}"]
  tags                = var.default_tags
}
