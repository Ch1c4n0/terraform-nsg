variable "inbound_ports" {
  type        = map(any)
  description = " portas liberadas"
  default = {
    101 = 80
    102 = 443
    103 = 3389
    104 = 22
  }

}


resource "azurerm_network_security_rule" "nsg-rule-inbound" {
  for_each                    = var.inbound_ports
  resource_group_name         = azurerm_resource_group.resource_group.name
  name                        = "inbound_port_${each.value}"
  priority                    = each.key
  destination_port_range      = each.value
  direction                   = "Inbound"
  access                      = "Allow"
  source_port_range           = "*"
  protocol                    = "Tcp"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = "nsg-lab-homolog"
  depends_on = [

    azurerm_network_security_group.nsg,
    azurerm_virtual_network.vnet,
    azurerm_resource_group.resource_group

  ]
}
