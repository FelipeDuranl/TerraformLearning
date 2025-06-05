provider "azurerm" {
    features {
    }
    subscription_id = ""
}

resource "azure_resouce_group" "rg-terraform" {
    name = "rg-terraform"
    location = "eastus"
}