
output "lb_name" {
  value = azurerm_lb.lb.name
}

output "lb_id" {
  value = azurerm_lb.lb.id
}

output "lb_public_ip" {
  value = azurerm_public_ip.lb_public_ip.ip_address
}

output "lb_backend_id" {
  value = azurerm_lb_backend_address_pool.lb_backend_pool.id
}