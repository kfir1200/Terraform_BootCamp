<!-- BEGIN_TF_DOCS -->

# About this module
this module create a load balancer in azure provider using terraform.

# Usage Example

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

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.lb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.lb_backend_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_probe.lb_Health_Probe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.lb_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule) | resource |
| [azurerm_public_ip.lb_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lb_backend_pool_name"></a> [lb\_backend\_pool\_name](#input\_lb\_backend\_pool\_name) | The Name of the Backend Pool for the Load Balancer | `string` | n/a | yes |
| <a name="input_lb_backend_port"></a> [lb\_backend\_port](#input\_lb\_backend\_port) | The backend port Pool for the Load Balancer | `number` | `8080` | no |
| <a name="input_lb_frontend_ip_name"></a> [lb\_frontend\_ip\_name](#input\_lb\_frontend\_ip\_name) | The Name of the Frontend IP for the Load Balancer | `string` | n/a | yes |
| <a name="input_lb_frontend_port"></a> [lb\_frontend\_port](#input\_lb\_frontend\_port) | The frontend port Pool for the Load Balancer | `number` | `8080` | no |
| <a name="input_lb_health_name"></a> [lb\_health\_name](#input\_lb\_health\_name) | The Name of the Health Probe for the Load Balancer | `string` | n/a | yes |
| <a name="input_lb_health_port"></a> [lb\_health\_port](#input\_lb\_health\_port) | The Health Probe port for the Load Balancer | `number` | `8080` | no |
| <a name="input_lb_health_protocol"></a> [lb\_health\_protocol](#input\_lb\_health\_protocol) | The protocol of the Health Probe for the Load Balancer | `string` | `"tcp"` | no |
| <a name="input_lb_ip_allocation"></a> [lb\_ip\_allocation](#input\_lb\_ip\_allocation) | Load Balancer ip allocation method: Static / Dynamic | `string` | `"Static"` | no |
| <a name="input_lb_name"></a> [lb\_name](#input\_lb\_name) | Load Balancer Name | `string` | n/a | yes |
| <a name="input_lb_rule_name"></a> [lb\_rule\_name](#input\_lb\_rule\_name) | The Name of the Backend Pool for the Load Balancer | `string` | n/a | yes |
| <a name="input_lb_rule_protocol"></a> [lb\_rule\_protocol](#input\_lb\_rule\_protocol) | The protocol of the rule for the Load Balancer | `string` | `"tcp"` | no |
| <a name="input_lb_sku"></a> [lb\_sku](#input\_lb\_sku) | The type of the Load Balancer | `string` | `"Standard"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location of the resource | `string` | `"eastus"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of a resource group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_backend_id"></a> [lb\_backend\_id](#output\_lb\_backend\_id) | outputs load balancer backend  id |
| <a name="output_lb_id"></a> [lb\_id](#output\_lb\_id) | outputs load balancer resource id |
| <a name="output_lb_name"></a> [lb\_name](#output\_lb\_name) | outputs the name of the load balancer  |
| <a name="output_lb_public_ip"></a> [lb\_public\_ip](#output\_lb\_public\_ip) | outputs the public ip of the load balancer |
<!-- END_TF_DOCS -->
