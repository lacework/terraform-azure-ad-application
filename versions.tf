terraform {
  required_version = ">= 0.12.31"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.6"
    }
  }
}