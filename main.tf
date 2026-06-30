resource "azurerm_resource_group" "app-pro" {
  name = "app-rg"
  location = "east us"
}

resource "azurerm_virtual_network" "app-vnet" {

depends_on = [ azurerm_resource_group.app-pro ]

  name = "app-vnet"
  location = "east us"
  resource_group_name = "app-rg"
  address_space = ["10.0.0.0/16"]
}
