resource "azurerm_public_ip" "main" {
  name                = "${var.environment}-${var.bastion_hostname}-${var.region}-PubIP"
  location            = "${data.azurerm_resource_group.rg.location}"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
  allocation_method   = "${var.pubip_allocation_method}"
  sku                 = "${var.pubip_sku}"
  tags                = "${var.default_tags}"
}

