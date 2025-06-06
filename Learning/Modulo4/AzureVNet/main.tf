
resource "azurerm_resource_group" "rg-vnet-01" {
  name     = var.resource_group_name
  location = var.location
  tags     = merge(var.tags, {created_by = "terraform", responsavel = "Felipe Duran"}) 
}

resource "azurerm_network_security_group" "nsg-01" {
  name                = "nsg-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_virtual_network" "vnet-01" {
  name                = var.resource_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnetipaddress_space
  dns_servers         = var.ip_dns_servers

  subnet {
    name             = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = "subnet2"
    address_prefixes = ["10.0.2.0/24"]
    security_group   = azurerm_network_security_group.nsg-01.id
  }

  tags = var.tags
}
