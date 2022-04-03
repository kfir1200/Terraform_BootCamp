

#create private dns zone for managed_db
resource "azurerm_private_dns_zone" "Managed_DB_Server_private_dns_zone" {
  name                = "${var.private_dns_name}-${var.env_prefix}.postgres.database.azure.com"
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

#create a link between the dns zone and the vnet
resource "azurerm_private_dns_zone_virtual_network_link" "Managed_DB_Server_dns_zone_virtual_network_link" {
  name                  = "${var.private_dns_link_name}-${var.env_prefix}"
  private_dns_zone_name = azurerm_private_dns_zone.Managed_DB_Server_private_dns_zone.name
  virtual_network_id    = var.vnet_id
  resource_group_name   = var.resource_group_name
  tags                  = var.tags
}

#create managed_db flexible server
resource "azurerm_postgresql_flexible_server" "Managed_DB_Flexible_Server" {
  name                   = "${var.managed_db_name}-${var.env_prefix}"
  resource_group_name    = var.resource_group_name
  location               = var.resource_group_location
  version                = var.managed_db_version
  delegated_subnet_id    = var.subnet_id
  private_dns_zone_id    = azurerm_private_dns_zone.Managed_DB_Server_private_dns_zone.id
  administrator_login    = var.managed_db_admin_user_name
  administrator_password = var.managed_db_admin_password
  zone                   = var.zone
  storage_mb             = var.storage
  sku_name               = var.sku
  tags                   = var.tags
  depends_on             = [azurerm_private_dns_zone_virtual_network_link.Managed_DB_Server_dns_zone_virtual_network_link]


}
# disable ssl for managed_db flexible server
resource "azurerm_postgresql_flexible_server_configuration" "disable_ssl" {
  name      = "require_secure_transport"
  server_id = azurerm_postgresql_flexible_server.Managed_DB_Flexible_Server.id
  value     = "off"
}
