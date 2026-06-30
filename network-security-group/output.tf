output "network_security_group_names" {

  value = {

    for key, value in azurerm_network_security_group.network_security_group :

    key => value.name

  }

}

output "network_security_group_ids" {

  value = {

    for key, value in azurerm_network_security_group.network_security_group :

    key => value.id

  }

}