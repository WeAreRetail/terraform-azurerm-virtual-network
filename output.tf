output "name" {
  value = azurerm_virtual_network.self.name
  description = "The name of the virtual network"
}

output "id" {
  value = azurerm_virtual_network.self.id
  description = "The virtual NetworkConfiguration ID"
}
