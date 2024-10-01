<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.4 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.3.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_bastion_host.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.3.0/docs/resources/bastion_host) | resource |
| [azurerm_public_ip.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.3.0/docs/resources/public_ip) | resource |
| [azurerm_subnet.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.3.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.3.0/docs/resources/virtual_network) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/4.3.0/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.3.0/docs/data-sources/resource_group) | data source |
| [azurerm_subnet.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.3.0/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_hostname"></a> [bastion\_hostname](#input\_bastion\_hostname) | Name of the basion host | `string` | `"test"` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A mapping of tags to assign to the resource. | `map(any)` | <pre>{<br/>  "ManagedByTerraform": "True"<br/>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Variable that defines the name of the environment. | `string` | `"dev"` | no |
| <a name="input_pubip_allocation_method"></a> [pubip\_allocation\_method](#input\_pubip\_allocation\_method) | Defines the allocation method for this IP address. Possible values are Static or Dynamic. | `string` | `"Static"` | no |
| <a name="input_pubip_sku"></a> [pubip\_sku](#input\_pubip\_sku) | The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. | `string` | `"Standard"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region in which resources are deployed. | `string` | `"weu"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the virtual networn, subnets and bastion host. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_subnet_prefix"></a> [subnet\_prefix](#input\_subnet\_prefix) | The address prefix and name to use for the subnet. | `map(any)` | <pre>{<br/>  "bastion": {<br/>    "ip": [<br/>      "10.0.250.0/24"<br/>    ],<br/>    "name": "AzureBastionSubnet"<br/>  },<br/>  "subnet_1": {<br/>    "ip": [<br/>      "10.0.1.0/24"<br/>    ],<br/>    "name": "Subnet_1"<br/>  },<br/>  "subnet_2": {<br/>    "ip": [<br/>      "10.0.2.0/24"<br/>    ],<br/>    "name": "Subnet_2"<br/>  }<br/>}</pre> | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | The address space that is used the virtual network. You can supply more than one address space. | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the virtual network. Changing this forces a new resource to be created. | `string` | `"VirtualNetwork1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_host"></a> [bastion\_host](#output\_bastion\_host) | Information about the bastion host. |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | Information about the subnets within the virtual network. |
| <a name="output_virtual_network"></a> [virtual\_network](#output\_virtual\_network) | Information about the virtual network. |
<!-- END_TF_DOCS -->