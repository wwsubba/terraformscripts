terraform {
   required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.27.0"
    }
    github = {
      source  = "integrations/github"
      version = "5.5.0"
    }
  }
  cloud {
    organization = "wwsubba"
    workspaces {
      name = "terraformscripts"
    }
  }
}
