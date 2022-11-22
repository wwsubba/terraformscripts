terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    },
      azuread = {
      source = "hashicorp/azuread"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
