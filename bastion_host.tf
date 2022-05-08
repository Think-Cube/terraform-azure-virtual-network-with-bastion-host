resource "azurerm_bastion_host" "main" {
  name                = "${var.environment}-${var.bastion_hostname}-${var.region}-bas"
  location            = "${data.azurerm_resource_group.rg.location}"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
  tags                = "${var.default_tags}"

  ip_configuration {
    name                 = "bastion_config"
    subnet_id            = "${azurerm_subnet.main["bastion"].id}"
    public_ip_address_id = "${azurerm_public_ip.main.id}"
  }

depends_on = [ "azurerm_virtual_network.main", "azurerm_subnet.main" ] 
}