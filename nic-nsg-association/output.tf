output "nic_nsg_association_ids" {

  value = {

    for key, value in azurerm_network_interface_security_group_association.association :

    key => value.id

  }

}