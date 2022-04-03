<!-- BEGIN_TF_DOCS -->
# About this module
this module creates a subnet  in azure provider using terraform.

# Usage Example

        module "subnet" {
          source              = "./Modules/Network/subnet"
          resource_group_name = azurerm_resource_group.vnet_rsg.name
          subnet_name         = ["web_subnet-${var.env_prefix}"]
          subnet_prefixes     = var.subnet_prefixes
          vnet_name           = module.vnet.vnet_name
        }

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |


## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location of the resource | `string` | `"eastus"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of an existing resource group to be imported. | `string` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | The name of the subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | the subnet prefixes | `list(string)` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | the name of the vnet | `string` | n/a | yes |

## Outputs

| Name | Description                |
|------|----------------------------|
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | outputs subnet resource id |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | outputs subnet name |
<!-- END_TF_DOCS -->
