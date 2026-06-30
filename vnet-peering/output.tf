output "virtual_network_peering_ids" {

  value = {

    for key, value in azurerm_virtual_network_peering.peering :

    key => value.id

  }

}