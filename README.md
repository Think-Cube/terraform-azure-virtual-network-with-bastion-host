<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_bastion_host.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/resources/bastion_host) | resource |
| [azurerm_public_ip.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/resources/public_ip) | resource |
| [azurerm_subnet.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/resources/virtual_network) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_hostname"></a> [bastion\_hostname](#input\_bastion\_hostname) | Name of the basion host | `string` | `"test"` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A mapping of tags to assign to the resource. | `map` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Var used for backend container name key | `string` | `"dev"` | no |
| <a name="input_pubip_allocation_method"></a> [pubip\_allocation\_method](#input\_pubip\_allocation\_method) | Defines the allocation method for this IP address. Possible values are Static or Dynamic. | `string` | `"Static"` | no |
| <a name="input_pubip_sku"></a> [pubip\_sku](#input\_pubip\_sku) | The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. | `string` | `"Standard"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region in which resources are deployed | `string` | `"weu"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location/region where the virtual network is created. Changing this forces a new resource to be created. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the virtual network. | `string` | n/a | yes |
| <a name="input_subnet_prefix"></a> [subnet\_prefix](#input\_subnet\_prefix) | The address prefix and name to use for the subnet. | `map(any)` | <pre>{<br>  "bastion": {<br>    "ip": [<br>      "10.0.250.0/24"<br>    ],<br>    "name": "AzureBastionSubnet"<br>  },<br>  "subnet_1": {<br>    "ip": [<br>      "10.0.1.0/24"<br>    ],<br>    "name": "Subnet_1"<br>  },<br>  "subnet_2": {<br>    "ip": [<br>      "10.0.2.0/24"<br>    ],<br>    "name": "Subnet_2"<br>  }<br>}</pre> | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | The address space that is used the virtual network. You can supply more than one address space. | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the virtual network. Changing this forces a new resource to be created. | `string` | `"VirtualNetwork1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address_space"></a> [address\_space](#output\_address\_space) | The list of address spaces used by the virtual network. |
| <a name="output_azure_subnet_id"></a> [azure\_subnet\_id](#output\_azure\_subnet\_id) | Lists the ID's of the subnets |
| <a name="output_bastion_pubip"></a> [bastion\_pubip](#output\_bastion\_pubip) | List the public IP of the bastion server |
| <a name="output_id"></a> [id](#output\_id) | The virtual NetworkConfiguration ID. |
| <a name="output_location"></a> [location](#output\_location) | The location/region where the virtual network is created. |
| <a name="output_name"></a> [name](#output\_name) | The name of the virtual network. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the resource group in which to create the virtual network. |
<!-- END_TF_DOCS -->

## How to use

```
module "virtual-network-with-bastion-host" {
  source  = "spy86/virtual-network-with-bastion-host/azure"
  version = "1.0.1"
  resource_group_name = "weu-test-rg"
  environment = "dev"
  region = "weu"
  resource_group_location = "West Europe"
  vnet_address_space = "10.0.0.0/16"
  vnet_name = "VirtualNetwork"
  subnet_prefix = {
    subnet_1 = {
      ip = ["10.0.1.0/24"]
      name  = "Subnet_1"
    }
    subnet_2 = {
      ip = ["10.0.2.0/24"]
      name = "Subnet_2"
    }
    subnet_3 = {
      ip = ["10.0.3.0/24"]
      name = "Subnet_3"
    }
  }
  default_tags = {
      Administrator = "Someone"
      Department = "IT"
      CostCentre = "ABC123"
      ContactPerson = "Someone@example.com"
      ManagedByTerraform = "True"
}
}
```