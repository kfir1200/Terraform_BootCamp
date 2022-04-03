
# create a subnet
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name[count.index]
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnet_prefixes[count.index]]
  count                = length(var.subnet_name)
}

