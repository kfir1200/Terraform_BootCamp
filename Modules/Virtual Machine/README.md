<!-- BEGIN_TF_DOCS -->

# About this module
this module creates a Virtul Machine in azure provider using terraform.

# Usage Example

      module "vm" {
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
        associate_load_balancer = false # change to true if you want to associate load balancer with this vm 
        associate_public_ip     = false # change to true if you want to associate public ip with his vm 
        lb_backend_address_id   = module.lb.lb_backend_id # if associate_load_balancer is true then this value in mandatory
        vm_type = var.vm_type
      }

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |


## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface_backend_address_pool_association.lb_backend_vm_nic_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_backend_address_pool_association) | resource |
| [azurerm_public_ip.pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | the user name of the Virtual Machine | `string` | n/a | yes |
| <a name="input_associate_load_balancer"></a> [associate\_load\_balancer](#input\_associate\_load\_balancer) | select true if you want to associate the vm with load balancer | `bool` | `false` | no |
| <a name="input_associate_public_ip"></a> [associate\_public\_ip](#input\_associate\_public\_ip) | select true if you want to associate the vm with public ip | `bool` | `false` | no |
| <a name="input_env_prefix"></a> [env\_prefix](#input\_env\_prefix) | prefix for staging / prod name | `string` | n/a | yes |
| <a name="input_image_offer"></a> [image\_offer](#input\_image\_offer) | image offer | `string` | `"0001-com-ubuntu-server-focal"` | no |
| <a name="input_image_publisher"></a> [image\_publisher](#input\_image\_publisher) | image publisher | `string` | `"Canonical"` | no |
| <a name="input_image_sku"></a> [image\_sku](#input\_image\_sku) | image sku | `string` | `"20_04-lts-gen2"` | no |
| <a name="input_image_version"></a> [image\_version](#input\_image\_version) | image version | `string` | `"latest"` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | instance count | `number` | n/a | yes |
| <a name="input_lb_backend_address_id"></a> [lb\_backend\_address\_id](#input\_lb\_backend\_address\_id) | the backend id of the load balancer | `any` | `null` | no |
| <a name="input_os_disk_caching"></a> [os\_disk\_caching](#input\_os\_disk\_caching) | os disk caching | `string` | `"ReadWrite"` | no |
| <a name="input_os_disk_storage_type"></a> [os\_disk\_storage\_type](#input\_os\_disk\_storage\_type) | os disk storage account type | `string` | `"Standard_LRS"` | no |
| <a name="input_pass_auth"></a> [pass\_auth](#input\_pass\_auth) | enable password authentication | `bool` | `false` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location of the resource | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | the sunet id for nic association | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | the tags to associate with this vm | `map(string)` | `{}` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | the name of the virtual Machine | `string` | n/a | yes |
| <a name="input_vm_password"></a> [vm\_password](#input\_vm\_password) | the password of the Virtual Machine | `string` | n/a | yes |
| <a name="input_vm_type"></a> [vm\_type](#input\_vm\_type) | the type of the Virtual Machine scale set | `string` | n/a | yes |

## Outputs

| Name | Description                      |
|------|----------------------------------|
| <a name="output_vm_password"></a> [vm\_password](#output\_vm\_password) | outputs the password of the vm    |
| <a name="output_vm_private_ip"></a> [vm\_private\_ip](#output\_vm\_private\_ip) | outputs the private ip of the vm |
| <a name="output_vm_public_ip"></a> [vm\_public\_ip](#output\_vm\_public\_ip) | outputs the public ip of the vm  |
<!-- END_TF_DOCS -->
