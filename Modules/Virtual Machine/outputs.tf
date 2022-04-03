
output "vm_public_ip" {
  value = azurerm_linux_virtual_machine.vm.*.public_ip_address
}

output "vm_private_ip" {
  value = azurerm_linux_virtual_machine.vm.*.private_ip_address
}

output "vm_password" {
  value = azurerm_linux_virtual_machine.vm.*.admin_password
}

