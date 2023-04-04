resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-lab-homolog"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  depends_on = [
    azurerm_resource_group.resource_group,
    azurerm_virtual_network.vnet
  ]

}


