data "azurerm_resource_group" "resource_group" {

  for_each = var.network_interfaces

  name = each.value.resource_group_name

}

data "azurerm_subnet" "subnet" {

  for_each = var.network_interfaces

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name

}

resource "azurerm_network_interface" "network_interface" {

  for_each = var.network_interfaces

  name                = each.value.name
  location            = data.azurerm_resource_group.resource_group[each.key].location
  resource_group_name = data.azurerm_resource_group.resource_group[each.key].name

  ip_configuration {

    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation

  }

  tags = lookup(var.tags, each.key, {})

}