output "resource_group_ids" {

  value = {

    for key, value in azurerm_resource_group.resource_group :

    key => value.id

  }

}

output "resource_group_names" {

  value = {

    for key, value in azurerm_resource_group.resource_group :

    key => value.name

  }

}

output "resource_group_locations" {

  value = {

    for key, value in azurerm_resource_group.resource_group :

    key => value.location

  }

}