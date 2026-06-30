data "azurerm_virtual_network" "local" {

  for_each = var.virtual_network_peerings

  name = each.value.virtual_network_name

  resource_group_name = each.value.resource_group_name

}

data "azurerm_virtual_network" "remote" {

  for_each = var.virtual_network_peerings

  name = each.value.remote_virtual_network_name

  resource_group_name = each.value.remote_resource_group_name

}

resource "azurerm_virtual_network_peering" "peering" {

  for_each = var.virtual_network_peerings

  name = each.value.name

  resource_group_name = each.value.resource_group_name

  virtual_network_name = data.azurerm_virtual_network.local[each.key].name

  remote_virtual_network_id = data.azurerm_virtual_network.remote[each.key].id

  allow_virtual_network_access = true

  allow_forwarded_traffic = true

  allow_gateway_transit = false

  use_remote_gateways = false

}