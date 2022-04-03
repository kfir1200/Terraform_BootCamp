<!-- BEGIN_TF_DOCS -->

# About this project
In this project i used terraform to build this infrastructure for the WeightTracker application project:

![WeightTracker infrastructure](https://bootcamp.rhinops.io/images/week-6-envs.png)

each module have an information how to use the module.

## How to use this project
1. clone or download the project
2. create a file `secret.auto.tfvars` with those variables:

        vm_password                    = ""
        managed_db_password            = ""
        my_external_ip                 = ""
        managed_db_admin_user_name     = ""
        admin_user_name                = ""
3. create a file `staging.tfvars` with those variables: 

        env_prefix = ""
        vm_count   = 
        location = ""
        vm_type = ""
        subnet_prefixes = [""]
        managed_db_subnet_prefixes = [""]
        source_address_prefix = ""

        tags = {
          Environment : "Staging"
        }
      
4. create a file `prodction.tfvars` with the same variables in step 3.

5. edit the values in steps 2-4 according to your credentials.
6. to create the  infrastructure in staging environment use those commands:

        terraform workspace create staging
        terraform workspace select staging
        terraform plan -var-file="staging.tfvars"
        
7. to create the infrastructure in production environment use those commands:

        terraform workspace create prod
        terraform workspace select production
        terraform plan -var-file="production.tfvars"
  





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
| <a name="module_ansible_vm"></a> [ansible\_vm](#module\_ansible\_vm) | ./Modules/Virtual Machine | n/a |
| <a name="module_lb"></a> [lb](#module\_lb) | ./Modules/Load_Balancer | n/a |
| <a name="module_managed_db"></a> [managed\_db](#module\_managed\_db) | ./Modules/ManagedDB | n/a |
| <a name="module_subnet"></a> [subnet](#module\_subnet) | ./Modules/Network/subnet | n/a |
| <a name="module_vnet"></a> [vnet](#module\_vnet) | ./Modules/Network/vnet | n/a |
| <a name="module_web_vm"></a> [web\_vm](#module\_web\_vm) | ./Modules/Virtual Machine | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.NSG_Managed_DB_Server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.NSG_Web_Server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_resource_group.db_rsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.vnet_rsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.web_rsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.Managed_DB_Server_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.DB_Server_subnet_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.Web_Server_subnet_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_user_name"></a> [admin\_user\_name](#input\_admin\_user\_name) | the user name for the vm instances | `string` | n/a | yes |
| <a name="input_env_prefix"></a> [env\_prefix](#input\_env\_prefix) | prefix for staging  / prod name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location of the resource | `string` | `"eastus"` | no |
| <a name="input_managed_db_admin_user_name"></a> [managed\_db\_admin\_user\_name](#input\_managed\_db\_admin\_user\_name) | the user name for admin managed db | `string` | n/a | yes |
| <a name="input_managed_db_password"></a> [managed\_db\_password](#input\_managed\_db\_password) | the password for admin managed db | `string` | n/a | yes |
| <a name="input_managed_db_resource_group_name"></a> [managed\_db\_resource\_group\_name](#input\_managed\_db\_resource\_group\_name) | the default name of the resource group | `string` | `"Managed_DB_SERVER_rsg"` | no |
| <a name="input_managed_db_subnet_prefixes"></a> [managed\_db\_subnet\_prefixes](#input\_managed\_db\_subnet\_prefixes) | the subnet prefixes | `list(string)` | n/a | yes |
| <a name="input_my_external_ip"></a> [my\_external\_ip](#input\_my\_external\_ip) | external ip to open port 22 for ssh | `string` | n/a | yes |
| <a name="input_source_address_prefix"></a> [source\_address\_prefix](#input\_source\_address\_prefix) | the source addres prefixe for open port 22 in nsg rule | `string` | n/a | yes |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | the subnet prefixes | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | n/a | yes |
| <a name="input_vm_count"></a> [vm\_count](#input\_vm\_count) | The number of instances to create vm's | `number` | n/a | yes |
| <a name="input_vm_password"></a> [vm\_password](#input\_vm\_password) | contain the password in order to connect to the vm machine | `string` | n/a | yes |
| <a name="input_vm_type"></a> [vm\_type](#input\_vm\_type) | the type of the Virtual Machine scale set | `string` | `"Standard_B2s"` | no |
| <a name="input_web_resource_group_name"></a> [web\_resource\_group\_name](#input\_web\_resource\_group\_name) | The name of the resource group in which the resources will be created | `string` | `"WEB_SERVER_rsg"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ansible_vm_public_ip_address"></a> [ansible\_vm\_public\_ip\_address](#output\_ansible\_vm\_public\_ip\_address) | outputs vm public ip   |
| <a name="output_web_vm_password"></a> [web\_vm\_password](#output\_web\_vm\_password) | outputs vm password |
| <a name="output_web_vm_private_ip_address"></a> [web\_vm\_private\_ip\_address](#output\_web\_vm\_private\_ip\_address) | outputs vm private ip  |




<!-- END_TF_DOCS -->
