terraform {
  required_version = ">= 0.14"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.25"
    }
    lacework = {
      source  = "lacework/lacework"
      version = "~> 1.18"
    }
  }
}
