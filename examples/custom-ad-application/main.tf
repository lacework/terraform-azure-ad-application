provider "azuread" {}

provider "azurerm" {
  features {}
}

module "ad_application" {
  source                      = "../../"
  application_name            = "lacework_custom_ad_application_name"
  application_identifier_uris = ["https://account.lacework.net"]
  tenant_id                   = "123abc12-abcd-1234-abcd-abcd12340123"
}
