output "network_interface_ids" {

  value = {

    for key, value in azurerm_network_interface.network_interface :

    key => value.id

  }

}

output "network_interface_names" {

  value = {

    for key, value in azurerm_network_interface.network_interface :

    key => value.name

  }

}