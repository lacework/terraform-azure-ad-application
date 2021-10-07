terraform {
  required_version = ">= 0.12.31"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.3.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.28"
    }
  }
}
