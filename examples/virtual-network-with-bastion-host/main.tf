provider "azurerm" {
features {}
}

module "virtual_network_with_bastion_host" {
  source  = "Think-Cube/virtual-network-with-bastion-host/azure"
  version = "1.0.0"
  resource_group_name = "dev-test-weu-rg"
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
