<!-- BEGIN_TF_DOCS -->

# About this module
this module create a Postgres Flexible managed db in azure provider using terraform.

# Usage Example

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


## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |


## Resources

| Name | Type |
|------|------|
| [azurerm_postgresql_flexible_server.Managed_DB_Flexible_Server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_configuration.disable_ssl](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_private_dns_zone.Managed_DB_Server_private_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.Managed_DB_Server_dns_zone_virtual_network_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | The admin password for connection to the managed db | `string` | n/a | yes |
| <a name="input_admin_user_name"></a> [admin\_user\_name](#input\_admin\_user\_name) | The admin user name for connection to the managed db | `string` | n/a | yes |
| <a name="input_managed_db_name"></a> [managed\_db\_name](#input\_managed\_db\_name) | The name of the managed db resource | `string` | n/a | yes |
| <a name="input_managed_db_version"></a> [managed\_db\_version](#input\_managed\_db\_version) | The version of psql | `string` | `"13"` | no |
| <a name="input_private_dns_link_name"></a> [private\_dns\_link\_name](#input\_private\_dns\_link\_name) | private dns link name | `string` | n/a | yes |
| <a name="input_private_dns_name"></a> [private\_dns\_name](#input\_private\_dns\_name) | private dns name | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location of the resource | `string` | `"eastus"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of a resource group | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | the type of the managed db | `string` | `"B_Standard_B1ms"` | no |
| <a name="input_storage"></a> [storage](#input\_storage) | the storage of the managed db in MB unit | `number` | `32768` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | delegated\_subnet\_id | `string` | n/a | yes |
| <a name="input_vnet_id"></a> [vnet\_id](#input\_vnet\_id) | the id of the vnet | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | the zone of the managed db | `string` | `"1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_managed_db_id"></a> [managed\_db\_id](#output\_managed\_db\_id) | outputs managed db resource id  |
| <a name="output_managed_db_name"></a> [managed\_db\_name](#output\_managed\_db\_name) | outputs managed db name |
<!-- END_TF_DOCS -->
