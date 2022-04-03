<!-- BEGIN_TF_DOCS -->
# About this module
this module creates a vnet in azure provider using terraform.

# Usage Example

    module "vnet" {
      source = "./Modules/Network/vnet"
    
      resource_group_name = azurerm_resource_group.vnet_rsg.name
      vnet_address_space  = "10.0.0.0/16"
      vnet_name           = "my_vnet-${var.env_prefix}"
      tags                = var.tags
      resource_group_location = var.location
    }

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |


## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location of the resource | `string` | `"eastus"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of an existing resource group to be imported. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | The address space of the vnet | `string` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the virtual network | `string` | n/a | yes |

## Outputs

| Name | Description              |
|------|--------------------------|
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | outputs vnet resource id |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | outputs vnet name        |
<!-- END_TF_DOCS -->
