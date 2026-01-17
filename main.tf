terraform { 
  cloud { 
    
    organization = "bmilli-org" 

    workspaces { 
      name = "terraformCI" 
    } 
  } 
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name = "yeezy-rg"
  location = "eastus"
}

resource "azurerm_storage_account" "storageacc" {
  name = "yeezystg"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    account_tier       = "Standard"
    account_replication_type = "LRS"
}