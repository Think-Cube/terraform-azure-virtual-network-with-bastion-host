## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.4 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.25.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_bastion_host.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.25.0/docs/resources/bastion_host) | resource |
| [azurerm_public_ip.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.25.0/docs/resources/public_ip) | resource |
| [azurerm_subnet.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.25.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.25.0/docs/resources/virtual_network) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/4.25.0/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.bastion](https://registry.terraform.io/providers/hashicorp/azurerm/4.25.0/docs/data-sources/resource_group) | data source |
| [azurerm_resource_group.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/4.25.0/docs/data-sources/resource_group) | data source |
| [azurerm_subnet.maindata](https://registry.terraform.io/providers/hashicorp/azurerm/4.25.0/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_host_ip_configuration"></a> [bastion\_host\_ip\_configuration](#input\_bastion\_host\_ip\_configuration) | Block for define Ip configuration for Bastion Host. Changing this forces a new resource to be created. | `string` | `"bastion_config"` | no |
| <a name="input_bastion_hostname"></a> [bastion\_hostname](#input\_bastion\_hostname) | Name of the basion host | `string` | `"test"` | no |
| <a name="input_bastion_resource_group_location"></a> [bastion\_resource\_group\_location](#input\_bastion\_resource\_group\_location) | The location/region where the bastion host is created. Changing this forces a new resource to be created. | `string` | `"West Europe"` | no |
| <a name="input_bastion_resource_group_name"></a> [bastion\_resource\_group\_name](#input\_bastion\_resource\_group\_name) | The name of the resource group in which to create the bastion host. | `string` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A mapping of tags to assign to the resource. | `map(any)` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Var used for backend container name key | `string` | `"dev"` | no |
| <a name="input_pubip_allocation_method"></a> [pubip\_allocation\_method](#input\_pubip\_allocation\_method) | Defines the allocation method for this IP address. Possible values are Static or Dynamic. | `string` | `"Static"` | no |
| <a name="input_pubip_sku"></a> [pubip\_sku](#input\_pubip\_sku) | The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. | `string` | `"Standard"` | no |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | Specifies the name of the Public IP. Changing this forces a new Public IP to be created. | `string` | `"bastion_pub_ip"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region in which resources are deployed | `string` | `"weu"` | no |
| <a name="input_subnet_prefix"></a> [subnet\_prefix](#input\_subnet\_prefix) | List of subnets with their prefixes and optional service endpoints and delegations | <pre>map(object({<br/>    name              = string<br/>    ip                = list(string)<br/>    service_endpoints = optional(list(object({<br/>      service = string<br/>    })), [])<br/>    delegations = optional(list(object({<br/>      name         = string<br/>      service_name = string<br/>      actions      = list(string)<br/>    })), [])<br/>    private_endpoint_network_policies = optional(string, null)<br/>    private_link_service_network_policies_enabled = optional(string, null)<br/>  }))</pre> | <pre>{<br/>  "example-subnet-1": {<br/>    "delegations": [<br/>      {<br/>        "actions": [<br/>          "Microsoft.Network/virtualNetworks/subnets/action"<br/>        ],<br/>        "name": "delegation1",<br/>        "service_name": "Microsoft.Web/serverFarms"<br/>      }<br/>    ],<br/>    "ip": [<br/>      "10.0.1.0/24"<br/>    ],<br/>    "name": "subnet-1",<br/>    "private_endpoint_network_policies": "Disabled",<br/>    "private_link_service_network_policies_enabled": false,<br/>    "service_endpoints": [<br/>      {<br/>        "service": "Microsoft.Storage"<br/>      },<br/>      {<br/>        "service": "Microsoft.Sql"<br/>      }<br/>    ]<br/>  },<br/>  "example-subnet-2": {<br/>    "delegations": [<br/>      {<br/>        "actions": [<br/>          "Microsoft.Network/virtualNetworks/subnets/action"<br/>        ],<br/>        "name": "delegation2",<br/>        "service_name": "Microsoft.Web/serverFarms"<br/>      }<br/>    ],<br/>    "ip": [<br/>      "10.0.2.0/24"<br/>    ],<br/>    "name": "subnet-2",<br/>    "private_endpoint_network_policies": "Disabled",<br/>    "private_link_service_network_policies_enabled": false,<br/>    "service_endpoints": [<br/>      {<br/>        "service": "Microsoft.Storage"<br/>      }<br/>    ]<br/>  }<br/>}</pre> | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | The address space that is used the virtual network. You can supply more than one address space. | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the virtual network. Changing this forces a new resource to be created. | `string` | `"VirtualNetwork1"` | no |
| <a name="input_vnet_resource_group_location"></a> [vnet\_resource\_group\_location](#input\_vnet\_resource\_group\_location) | The location/region where the virtual network is created. Changing this forces a new resource to be created. | `string` | `"West Europe"` | no |
| <a name="input_vnet_resource_group_name"></a> [vnet\_resource\_group\_name](#input\_vnet\_resource\_group\_name) | The name of the resource group in which to create the virtual network. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address_space"></a> [address\_space](#output\_address\_space) | The list of address spaces used by the virtual network. |
| <a name="output_bastion_pubip"></a> [bastion\_pubip](#output\_bastion\_pubip) | List the public IP of the bastion server |
| <a name="output_id"></a> [id](#output\_id) | The virtual NetworkConfiguration ID. |
| <a name="output_location"></a> [location](#output\_location) | The location/region where the virtual network is created. |
| <a name="output_name"></a> [name](#output\_name) | The name of the virtual network. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the resource group in which to create the virtual network. |
