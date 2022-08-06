provider "azurerm" {
features {}
}

module "virtual-network-with-bastion-host" {
  source  = "spy86/virtual-network-with-bastion-host/azure"
  version = "1.0.9"
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
      Administrator = "Someone"
      Department = "IT"
      CostCentre = "ABC123"
      ContactPerson = "Someone@example.com"
      ManagedByTerraform = "True"
}
}