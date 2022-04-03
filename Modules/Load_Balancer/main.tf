

# create public ip for Load Balancer
resource "azurerm_public_ip" "lb_public_ip" {
  name                = var.lb_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = var.lb_ip_allocation
  sku = var.lb_sku
  tags = var.tags

}
# create load balancer for vmss
resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = var.lb_sku
  tags                = var.tags
  frontend_ip_configuration {
    name                 = var.lb_frontend_ip_name
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
    depends_on = [azurerm_public_ip.lb_public_ip]
}
#create backend pool for Load Balancer
  resource "azurerm_lb_backend_address_pool" "lb_backend_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = var.lb_backend_pool_name
}
#create a rule for Load Balancer
resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = var.lb_rule_name
  protocol                       = var.lb_rule_protocol
  frontend_port                  = var.lb_frontend_port
  backend_port                   = var.lb_backend_port
  frontend_ip_configuration_name = var.lb_frontend_ip_name
  resource_group_name            = var.resource_group_name
  probe_id                       = azurerm_lb_probe.lb_Health_Probe.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb_backend_pool.id]

}
#create Health Probe for Load Balancer
resource "azurerm_lb_probe" "lb_Health_Probe" {
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.lb.id
  name                = var.lb_health_name
  port                = var.lb_health_port
  protocol            =  var.lb_health_protocol

  depends_on=[azurerm_lb.lb]
}
