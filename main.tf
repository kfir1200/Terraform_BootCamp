#create resource group for vnet
resource "azurerm_resource_group" "vnet_rsg" {
  name     = "vnet_rsg-${var.env_prefix}"
  location = var.location
  tags     = var.tags

}

#create resource group for web vm
resource "azurerm_resource_group" "web_rsg" {
  name     = "web_rsg-${var.env_prefix}"
  location = var.location
  tags     = var.tags


}

#create resource group for db vm
resource "azurerm_resource_group" "db_rsg" {
  name     = "db_rsg-${var.env_prefix}"
  location = var.location
  tags     = var.tags


}

#create a Load Balancer
module "lb" {
  source = "./Modules/Load_Balancer"

  lb_backend_pool_name = "lb_backend-${var.env_prefix}"
  lb_frontend_ip_name  = "lb_frontend_ip-${var.env_prefix}"
  lb_health_name       = "lb_health-${var.env_prefix}"
  lb_name              = "lb-${var.env_prefix}"
  lb_rule_name         = "lb_rule-${var.env_prefix}"
  resource_group_name  = azurerm_resource_group.web_rsg.name
  resource_group_location = var.location
  tags = var.tags
}

#create a vnet
module "vnet" {
  source = "./Modules/Network/vnet"

  resource_group_name = azurerm_resource_group.vnet_rsg.name
  vnet_address_space  = "10.0.0.0/16"
  vnet_name           = "my_vnet-${var.env_prefix}"
  tags                = var.tags
  resource_group_location = var.location
}

# create postgresql manage db
module "managed_db" {
  source                = "./Modules/ManagedDB"
  managed_db_admin_password        = var.managed_db_password
  managed_db_admin_user_name       = var.managed_db_admin_user_name
  managed_db_name                  = "managed-postgres"
  private_dns_link_name            = "managed-db"
  private_dns_name                 = "managed-db"
  resource_group_name              = azurerm_resource_group.db_rsg.name
  resource_group_location          = var.location
  subnet_id                        = azurerm_subnet.Managed_DB_Server_subnet.id
  vnet_id                          = module.vnet.vnet_id
  env_prefix                       = var.env_prefix
  tags                             = var.tags
}

# create a vm for Ansible Control
module "ansible_vm" {
  source                = "./Modules/Virtual Machine"
  vm_name               = "ansible-vm"
  admin_username        = var.admin_user_name
  resource_group_name   = azurerm_resource_group.web_rsg.name
  resource_group_location = var.location
  vm_password           = var.vm_password
  subnet_id             = module.subnet.subnet_id[0]
  instance_count        = 1
  env_prefix            = var.env_prefix
  tags                  = var.tags
  associate_public_ip   = true
  vm_type = var.vm_type
}

# create a vm for web servers
module "web_vm" {
  source                  = "./Modules/Virtual Machine"
  vm_name                 = "web-vm"
  admin_username          = var.admin_user_name
  resource_group_name     = azurerm_resource_group.web_rsg.name
  resource_group_location = var.location
  vm_password             = var.vm_password
  subnet_id               = module.subnet.subnet_id[0]
  instance_count          = var.vm_count
  env_prefix              = var.env_prefix
  tags                    = var.tags
  associate_load_balancer = true
  lb_backend_address_id   = module.lb.lb_backend_id
  vm_type = var.vm_type
}



