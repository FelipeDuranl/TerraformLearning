provider "azurerm" {
  features {}
  subscription_id = "f915a48f-465f-46eb-83cf-eb62f2ffb38d"
}

variable "location" {
  type        = string
  description = "location for the resource"
  default     = "eastus"
}


variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
  default     = "rg-vnet-01"
}

variable "tags" {
  type        = map(string)
  description = "tags for the resource"
  default = {
    environment = "development"
    owner       = "terraform"
  }

}

variable "vnetipaddress_space" {
  type        = list(string)
  description = "IP address space for the virtual network"
  default     = ["10.0.0.0/16", "192.168.0.0/16"] 
  
}

variable "ip_dns_servers" {
  type        = list(string)
  description = "DNS servers for the virtual network"
  default     = ["10.0.0.4", "10.0.0.5"]
  
}