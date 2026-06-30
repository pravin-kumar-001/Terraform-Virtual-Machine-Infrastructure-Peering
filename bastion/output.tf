output "bastion_ids" {

  value = {

    for key, value in azurerm_bastion_host.bastion :

    key => value.id

  }

}

output "bastion_names" {

  value = {

    for key, value in azurerm_bastion_host.bastion :

    key => value.name

  }

}