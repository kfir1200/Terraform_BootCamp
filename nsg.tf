#create NSG for managed db server
resource "azurerm_network_security_group" "NSG_Managed_DB_Server" {
  name                = "NSG_Managed_DB_Server-${var.env_prefix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.db_rsg.name


  security_rule {
    name                       = "Open_port_5432"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "TCP"
    source_port_range          = "*"
    destination_port_range     = "5432"
    source_address_prefix      = var.source_address_prefix
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "DenyAllInBound"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "TCP"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = var.tags

}

#create NSG association with DB_Server subnet
resource "azurerm_subnet_network_security_group_association" "DB_Server_subnet_nsg" {
  subnet_id                 = azurerm_subnet.Managed_DB_Server_subnet.id
  network_security_group_id = azurerm_network_security_group.NSG_Managed_DB_Server.id
}

#create NSG for web server
resource "azurerm_network_security_group" "NSG_Web_Server" {
  name                = "NSG_Web_Server-${var.env_prefix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.web_rsg.name

  security_rule {
    name                       = "Open_port_22"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "TCP"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.my_external_ip # external ip to open port 22 for ssh
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Open_port_8080"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "TCP"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = var.tags
}

#create NSG association with Web_Server subnet
resource "azurerm_subnet_network_security_group_association" "Web_Server_subnet_nsg" {
  subnet_id                 = module.subnet.subnet_id[0]
  network_security_group_id = azurerm_network_security_group.NSG_Web_Server.id
}