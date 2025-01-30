data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "vnet" {
  name = var.vnet_resource_group_name
}

data "azurerm_resource_group" "bastion" {
  name = var.bastion_resource_group_name
}
