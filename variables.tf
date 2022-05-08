###########################
# Common vars
###########################
variable "environment" {
  description = "Var used for backend container name key"
  type = string
  default = "dev"
}
variable "default_tags" {
  description = "A mapping of tags to assign to the resource."
  type = map
}
variable "region" {
  description = "Region in which resources are deployed"
  type = string
  default = "weu"
}
###########################
# Resource groups vars
###########################
variable "resource_group_location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
  default = "West Europe"
  type = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  type = string
}
############################
#VNET&SUBNET&PUBLIC IP variable
############################
variable "vnet_name" {
    description = "The name of the virtual network. Changing this forces a new resource to be created."
    type = string
    default = "VirtualNetwork1"
}
variable "vnet_address_space" {
    description = "The address space that is used the virtual network. You can supply more than one address space."
    type = string
    default = "10.0.0.0/16"
}
variable "subnet_prefix" {
  description = "The address prefix and name to use for the subnet."
  type = map(any)
  default = {
    subnet_1 = {
      ip = ["10.0.1.0/24"]
      name  = "Subnet_1"
    }
    subnet_2 = {
      ip = ["10.0.2.0/24"]
      name = "Subnet_2"
    }
    bastion = {
      ip = ["10.0.250.0/24"]
      name = "AzureBastionSubnet"
    }
  }
}
variable "bastion_hostname" {
  type        = string
  description = "Name of the basion host"
  default     = "test"
}
variable "pubip_allocation_method" {
  type        = string
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  default     = "Static"
}
variable "pubip_sku" {
  type        = string
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic."
  default     = "Standard"
}