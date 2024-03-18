output "virtual_network" {
  description = "Information about the virtual network."
  value = {
    name          = azurerm_virtual_network.main.name
    id            = azurerm_virtual_network.main.id
    address_space = azurerm_virtual_network.main.address_space
  }
  sensitive = false
}

output "subnets" {
  description = "Information about the subnets within the virtual network."
  value = {
    for subnet_name, subnet in azurerm_subnet.main : subnet_name => {
      name             = subnet.name
      id               = subnet.id
      address_prefixes = subnet.address_prefixes
    }
  }
  sensitive = false
}

output "bastion_host" {
  description = "Information about the bastion host."
  value = {
    name           = azurerm_bastion_host.main.name
    private_ip     = azurerm_bastion_host.main.ip_configuration[0].private_ip_address
    public_ip      = azurerm_public_ip.main.ip_address
    bastion_subnet = azurerm_bastion_host.main.ip_configuration[0].subnet_id
  }
  sensitive = false
}
