
#create a subnet for web server
module "subnet" {
  source              = "./Modules/Network/subnet"
  resource_group_name = azurerm_resource_group.vnet_rsg.name
  subnet_name         = ["web_subnet-${var.env_prefix}"]
  subnet_prefixes     = var.subnet_prefixes
  vnet_name           = module.vnet.vnet_name
}

#create subnet with delegation for managed db
resource "azurerm_subnet" "Managed_DB_Server_subnet" {
  name                 = "Managed_DB_Server_subnet-${var.env_prefix}"
  resource_group_name  = azurerm_resource_group.vnet_rsg.name
  virtual_network_name = module.vnet.vnet_name
  address_prefixes     = var.managed_db_subnet_prefixes
  service_endpoints    = ["Microsoft.Storage"]

  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

