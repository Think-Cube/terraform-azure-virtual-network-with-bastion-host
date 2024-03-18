# Terraform Module: Virtual Network with Bastion Host

This Terraform module provisions a virtual network in Azure with a bastion host.

## Usage

```hcl
provider "azurerm" {
features {}
}

module "virtual_network_with_bastion_host" {
  source  = "Think-Cube/virtual-network-with-bastion-host/azure"
  version = "1.0.0"
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
    bastion = {
      ip = ["10.0.250.0/24"]
      name = "AzureBastionSubnet"
    }
  }
  default_tags = {
      Administrator     = "John Doe"
      Department        = "IT"
      CostCentre        = "CC123"
      ContactPerson     = "Jane Smith"
      ManagedByTerraform = "True"
}
}
```

### Variables

* `resource_group_name`: The name of the resource group in which to create the resources.
* `environment`: The environment name (e.g., dev, stage, prod).
* `region`: The Azure region in which to deploy the resources.
* `resource_group_location`: The location of the resource group.
* `vnet_address_space`: The address space for the virtual network.
* `vnet_name`: The name of the virtual network.
* `subnet_prefix`: Map containing subnet details (name and IP).
* `default_tags`: Default tags to be applied to all resources.

### Outputs

* `virtual_network`: Information about the virtual network.
* `subnets`: Information about the subnets.
* `bastion_host`: Information about the bastion host.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

## Contribution

Feel free to contribute by opening issues or pull requests. Your feedback and improvements are highly appreciated!
