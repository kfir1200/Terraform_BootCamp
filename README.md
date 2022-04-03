<!-- BEGIN_TF_DOCS -->

# About this project
In this project i used terraform to build this infrastructure for the WeightTracker application project:

![WeightTracker infrastructure](https://bootcamp.rhinops.io/images/week-4-project-env.png)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 2.99 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.99.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_create_vmss"></a> [create\_vmss](#module\_create\_vmss) | ./Modules/Virtual Machine Scale Set | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.lb_WEEK5](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.lb_backend_pool_WEEK5](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_probe.Load_Balancer_Health_Probe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.Load_Balancer_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule) | resource |
| [azurerm_network_security_group.NSG_Managed_DB_Server_WEEK5](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.NSG_Web_Server_WEEK5](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_postgresql_flexible_server.Managed_DB_Flexible_Server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_private_dns_zone.Managed_DB_Server_private_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.Managed_DB_Server_dns_zone_virtual_network_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_public_ip.lb_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_public_ip.vmss-public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.Managed_DB_SERVER_rsg_WEEK5](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.WEB_SERVER_rsg_WEEK5](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.WEEK5_rsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.Managed_DB_Server_WEEK5_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.vmss_subnet_WEEK5](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.DB_Server_WEEK5_subnet_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.Web_Server_WEEK5_subnet_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.My_VNet_WEEK5](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_user_name"></a> [admin\_user\_name](#input\_admin\_user\_name) | the user name for the vmss instances | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location of the resource | `string` | `"eastus"` | no |
| <a name="input_managed_db_password"></a> [managed\_db\_password](#input\_managed\_db\_password) | the password for admin managed db | `string` | n/a | yes |
| <a name="input_managed_db_resource_group_name"></a> [managed\_db\_resource\_group\_name](#input\_managed\_db\_resource\_group\_name) | the default name of the resource group | `string` | `"Managed_DB_SERVER_rsg"` | no |
| <a name="input_my_external_ip"></a> [my\_external\_ip](#input\_my\_external\_ip) | external ip to open port 22 for ssh | `string` | n/a | yes |
| <a name="input_vm_password"></a> [vm\_password](#input\_vm\_password) | contain the password in order to connect to the vm machine | `string` | n/a | yes |
| <a name="input_web_resource_group_name"></a> [web\_resource\_group\_name](#input\_web\_resource\_group\_name) | The name of the resource group in which the resources will be created | `string` | `"WEB_SERVER_rsg"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_web_vm_password"></a> [web\_vm\_password](#output\_web\_vm\_password) | n/a |
<!-- END_TF_DOCS -->
