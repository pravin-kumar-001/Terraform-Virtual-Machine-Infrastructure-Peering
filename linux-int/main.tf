data "azurerm_resource_group" "resource_group" {

  for_each = var.linux_virtual_machines

  name = each.value.resource_group_name

}

data "azurerm_network_interface" "network_interface" {

  for_each = var.linux_virtual_machines

  name                = each.value.network_interface
  resource_group_name = each.value.resource_group_name

}

resource "azurerm_linux_virtual_machine" "linux_virtual_machine" {

  for_each = var.linux_virtual_machines

  name                = each.value.name
  location            = data.azurerm_resource_group.resource_group[each.key].location
  resource_group_name = data.azurerm_resource_group.resource_group[each.key].name

  size = each.value.size

  admin_username = each.value.admin_username

  admin_password = each.value.admin_password

  disable_password_authentication = false

  network_interface_ids = [
    data.azurerm_network_interface.network_interface[each.key].id
  ]

  os_disk {

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }

  source_image_reference {

    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"

  }

  tags = lookup(var.tags, each.key, {})

}