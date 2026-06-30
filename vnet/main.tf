data "azurerm_resource_group" "resource_group" {

  for_each = var.virtual_networks

  name = each.value.resource_group_name

}

resource "azurerm_virtual_network" "virtual_network" {

  for_each = var.virtual_networks

  name = each.value.name

  resource_group_name = data.azurerm_resource_group.resource_group[each.key].name

  location = data.azurerm_resource_group.resource_group[each.key].location

  address_space = each.value.address_space

  tags = lookup(var.tags, each.key, {})

}