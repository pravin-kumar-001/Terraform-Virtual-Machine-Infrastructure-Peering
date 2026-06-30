data "azurerm_resource_group" "resource_group" {

  for_each = var.storage_accounts

  name = each.value.resource_group_name

}

resource "azurerm_storage_account" "storage_account" {

  for_each = var.storage_accounts

  name                     = each.value.name
  resource_group_name      = data.azurerm_resource_group.resource_group[each.key].name
  location                 = data.azurerm_resource_group.resource_group[each.key].location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  account_kind             = each.value.account_kind
  access_tier              = each.value.access_tier
  min_tls_version          = each.value.min_tls_version

  tags = lookup(var.tags, each.key, {})

}