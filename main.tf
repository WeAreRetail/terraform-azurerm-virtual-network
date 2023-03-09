locals {
  specific_tags = {
    "description" = var.description
  }

  location    = data.azurerm_resource_group.parent_group.location
  parent_tags = { for n, v in data.azurerm_resource_group.parent_group.tags : n => v if n != "description" }
  tags        = { for n, v in merge(local.parent_tags, local.specific_tags) : n => v if v != "" }
}

data "azurerm_resource_group" "parent_group" {
  name = var.resource_group_name
}


resource "azurecaf_name" "self" {
  name          = ""
  resource_type = "azurerm_virtual_network"
  prefixes      = var.caf_prefixes
  suffixes      = []
  use_slug      = true
  clean_input   = true
  separator     = ""
}

resource "azurerm_virtual_network" "self" {
  name                = azurecaf_name.self.result
  location            = coalesce(var.custom_location, data.azurerm_resource_group.parent_group.location)
  resource_group_name = data.azurerm_resource_group.parent_group.name
  tags                = local.tags
  address_space       = var.address_spaces
}

resource "azurerm_virtual_network_dns_servers" "self" {
  count = length(var.dns_servers) > 0 ? 1 : 0

  virtual_network_id = azurerm_virtual_network.self.id
  dns_servers        = var.dns_servers
}
