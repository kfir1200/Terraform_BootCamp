
#create nic for the vm
resource "azurerm_network_interface" "nic" {

  count = var.instance_count
  location            = var.resource_group_location
  name                = var.instance_count > 1 ? "${var.vm_name}-${var.env_prefix}-${count.index}":"${var.vm_name}-${var.env_prefix}"
  resource_group_name = var.resource_group_name
  ip_configuration {

    name                          = var.instance_count > 1 ? "${var.vm_name}-ip-${var.env_prefix}-${count.index}": "${var.vm_name}-ip-${var.env_prefix}"
    private_ip_address_allocation = "Dynamic"
    subnet_id = var.subnet_id
    public_ip_address_id = var.associate_public_ip ? azurerm_public_ip.pip[count.index].id : null
  }

  tags = var.tags
}

#create public ip for the vm
resource "azurerm_public_ip" "pip" {
  count = var.associate_public_ip ? var.instance_count:0
  allocation_method   = "Static"
  location            = var.resource_group_location
  name                = var.instance_count > 1 ? "${var.vm_name}-pip-${var.env_prefix}-${count.index}":"${var.vm_name}-pip-${var.env_prefix}"
  resource_group_name = var.resource_group_name
  sku = "Standard"
  tags = var.tags
}
#create a vm
resource "azurerm_linux_virtual_machine" "vm" {
  count               = var.instance_count
  name                = var.instance_count > 1 ? "${var.vm_name}-${var.env_prefix}-${count.index}": "${var.vm_name}-${var.env_prefix}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = var.vm_type
  admin_username      = var.admin_username
  disable_password_authentication = var.pass_auth
  admin_password                  = var.vm_password # get the vm password from secret.auto.tfvars file
  network_interface_ids = [element(azurerm_network_interface.nic.*.id, count.index)]


  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_type
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
    tags      = var.tags
}

#create association with the lb and the vm
resource "azurerm_network_interface_backend_address_pool_association" "lb_backend_vm_nic_association" {
  count                   = var.associate_load_balancer ? var.instance_count:0
  network_interface_id    = azurerm_network_interface.nic[count.index].id
  ip_configuration_name   = var.instance_count > 1 ? "${var.vm_name}-ip-${var.env_prefix}-${count.index}": "${var.vm_name}-ip-${var.env_prefix}"
  backend_address_pool_id = var.associate_load_balancer ? var.lb_backend_address_id: null

}
