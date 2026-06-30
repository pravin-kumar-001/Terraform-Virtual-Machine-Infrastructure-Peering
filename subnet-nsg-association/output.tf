output "subnet_nsg_association_ids" {

  value = {

    for key, value in azurerm_subnet_network_security_group_association.association :

    key => value.id

  }

}