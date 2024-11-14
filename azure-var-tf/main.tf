# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.RG
  location = var.loc
}
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = var.loc
  resource_group_name = var.RG

address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "subnet1"
    address_prefix = ["10.0.1.0/24"]
  }

  tags = {
    environment = "Production"
  }
}





# this is now an "input" value 
variable "loc" {
  type    = string
  default = "westus2"
}
# this is now an "input" value 
variable "RG" {
  type    = string
  default = "myTFResourceGroup"
}

