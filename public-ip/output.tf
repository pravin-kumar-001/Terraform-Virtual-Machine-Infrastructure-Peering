output "public_ip_ids" {

  value = {

    for key, value in azurerm_public_ip.public_ip :

    key => value.id

  }

}

output "public_ip_addresses" {

  value = {

    for key, value in azurerm_public_ip.public_ip :

    key => value.ip_address

  }

}

output "public_ip_names" {

  value = {

    for key, value in azurerm_public_ip.public_ip :

    key => value.name

  }

}