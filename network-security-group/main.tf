data "azurerm_resource_group" "resource_group" {

  for_each = var.network_security_groups

  name = each.value.resource_group_name

}

resource "azurerm_network_security_group" "network_security_group" {

  for_each = var.network_security_groups

  name                = each.value.name
  location            = data.azurerm_resource_group.resource_group[each.key].location
  resource_group_name = data.azurerm_resource_group.resource_group[each.key].name

  security_rule {

    name                       = "Allow-SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }

  security_rule {

    name                       = "Allow-HTTP"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }

  security_rule {

    name                       = "Allow-HTTPS"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }

  security_rule {

    name                       = "Allow-MySQL"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3306"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }

  tags = lookup(var.tags, each.key, {})

}