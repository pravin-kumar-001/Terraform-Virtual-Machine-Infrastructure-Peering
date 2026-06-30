output "virtual_network_names" {

  value = {

    for key, value in azurerm_virtual_network.virtual_network :

    key => value.name

  }

}

output "virtual_network_ids" {

  value = {

    for key, value in azurerm_virtual_network.virtual_network :

    key => value.id

  }

}