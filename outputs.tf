
output "ansible_vm_public_ip_address" {
  value = module.ansible_vm.vm_public_ip
}

output "web_vm_private_ip_address" {
  value = module.web_vm.vm_private_ip
}

output "web_vm_password" {
  value     = module.web_vm.vm_password
  sensitive = true
}
