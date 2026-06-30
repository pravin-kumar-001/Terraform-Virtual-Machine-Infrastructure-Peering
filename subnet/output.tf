output "subnet_names" {

  value = {

    for key, value in azurerm_subnet.subnet :

    key => value.name

  }

}

output "subnet_ids" {

  value = {

    for key, value in azurerm_subnet.subnet :

    key => value.id

  }

}