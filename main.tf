terraform {
  backend "azurerm" {
    resource_group_name = "rg-29aug"
    storage_account_name = "stg29aug"
    container_name = "29augcontainer"
    key = "29aug.tfstate"
    
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.39.0"
    }
  }
}


provider "azurerm" {
  features {}

  subscription_id = "76095b6e-0585-402e-8e43-281835aebfd1"
}

resource "azurerm_resource_group" "rg-29aug" {

  name     = "rg-29aug"
  location = "West US"
}

resource "azurerm_resource_group" "rg-29aug1" {

  name     = "rg-29aug1"
  location = "West US"
}



resource "azurerm_storage_account" "stgaug" {
  depends_on               = [azurerm_resource_group.rg-29aug]
  name                     = "stg29aug"
  resource_group_name      = "rg-29aug"
  location                 = "West Us"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "augcontainer" {
  name                  = "29augcontainer"
  storage_account_id    = azurerm_storage_account.stgaug.id
  container_access_type = "private"
}

