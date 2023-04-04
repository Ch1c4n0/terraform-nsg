resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-lab-homolog"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  address_space = length(var.address_space) == 1 ? concat(var.address_space, ["10.10.0.0/16",
  "192.168.20.0/24"]) : var.address_space
  tags = merge(var.tags_var, {

    Data        = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
    Projeto     = lower("Titan")
    Responsavel = upper("Marcelo Goncalves")
    Tecnologia  = title("hashicorp terraform")


  })

  depends_on = [
    azurerm_resource_group.resource_group
  ]

}

output "vnet-ips" {
  value = length("${azurerm_virtual_network.vnet.address_space}")

}

output "vnet-tags" {
  value = length("${azurerm_virtual_network.vnet.tags}")

}