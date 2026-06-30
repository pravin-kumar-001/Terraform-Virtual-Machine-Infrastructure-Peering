data "azurerm_resource_group" "resource_group" {

  for_each = var.public_ips

  name = each.value.resource_group_name

}

resource "azurerm_public_ip" "public_ip" {

  for_each = var.public_ips

  name                = each.value.name
  location            = data.azurerm_resource_group.resource_group[each.key].location
  resource_group_name = data.azurerm_resource_group.resource_group[each.key].name

  allocation_method = each.value.allocation_method
  sku               = each.value.sku

  tags = lookup(var.tags, each.key, {})

}