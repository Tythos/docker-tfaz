terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.25"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = ">=2.29"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {}
