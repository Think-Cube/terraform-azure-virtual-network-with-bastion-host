output "id" {
  description = "The virtual NetworkConfiguration ID."
  value       = azurerm_virtual_network.main.id
  sensitive   = false
}
output "name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.main.name
  sensitive   = false
}
output "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  value       = azurerm_virtual_network.main.resource_group_name
  sensitive   = false
}
output "location" {
  description = "The location/region where the virtual network is created."
  value       = azurerm_virtual_network.main.location
  sensitive   = false
}
output "address_space" {
  description = "The list of address spaces used by the virtual network."
  value       = azurerm_virtual_network.main.address_space
  sensitive   = false
}
output "bastion_pubip" {
  value       = azurerm_public_ip.main.ip_address
  description = "List the public IP of the bastion server"
  sensitive   = false
}
