output "linux_virtual_machine_ids" {

  value = {

    for key, value in azurerm_linux_virtual_machine.linux_virtual_machine :

    key => value.id

  }

}

output "linux_virtual_machine_names" {

  value = {

    for key, value in azurerm_linux_virtual_machine.linux_virtual_machine :

    key => value.name

  }

}