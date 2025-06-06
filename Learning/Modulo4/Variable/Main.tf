provider "azurerm" {
  features {}
  subscription_id = ""
}


variable "location" {
    type = string
    description = "location for the resource"
    default = "eastus"
}

resource "azurerm_resource_group" "rg-terraform" {
    name   = "rg-terraform"
    location = var.location
}