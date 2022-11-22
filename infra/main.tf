terraform {
  experiments = [module_variable_optional_attrs]
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

module "api-cloud-keyvault" {
  source = "./modules/cloud_keyvault"
}
