resource "azurerm_public_ip" "main" {
  name                = "${var.environment}-${var.public_ip_name}"
  location            = data.azurerm_resource_group.bastion.location
  resource_group_name = data.azurerm_resource_group.bastion.name
  allocation_method   = var.pubip_allocation_method
  sku                 = var.pubip_sku
  tags                = var.default_tags
}

