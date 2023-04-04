terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.50.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {

  }
}

resource "azurerm_resource_group" "resource_group" {
  location = var.location
  name     = "rg-lab"
  tags = merge(var.tags_var, {

    Data        = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
    Projeto     = lower("Titan")
    Responsavel = upper("Marcelo Goncalves")
    Tecnologia  = title("hashicorp terraform")


  })

}



