locals {
  tenant_id = length(var.tenant_id) > 0 ? var.tenant_id : data.azurerm_subscription.primary.tenant_id
  subscription_ids = var.all_subscriptions ? (
    // the user wants to grant access to all subscriptions
    [for s in data.azurerm_subscriptions.available.subscriptions : s.subscription_id]
    ) : (
    // or, if the user wants to grant a list of subscriptions, if none then we default to the primary subscription
    length(var.subscription_ids) > 0 ? var.subscription_ids : [data.azurerm_subscription.primary.subscription_id]
  )
  application_id = var.create ? (
    length(azuread_application.lacework) > 0 ? azuread_application.lacework[0].application_id : ""
  ) : ""
  application_password = var.create ? (
    length(azuread_application_password.client_secret) > 0 ? azuread_application_password.client_secret[0].value : ""
  ) : ""
  service_principal_id = var.create ? (
    length(azuread_service_principal.lacework) > 0 ? azuread_service_principal.lacework[0].object_id : ""
  ) : ""
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

data "azuread_client_config" "current" {}

## Create a Group to host the service principal. The group is then assigned Directory Reader
resource "azuread_group" "readers" {
  display_name     = "Directory Readers"
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
  assignable_to_role = true
}

resource "azuread_application" "lacework" {
  count         = var.create ? 1 : 0
  display_name  = "Lacework Reader"
  owners        = [data.azuread_client_config.current.object_id]
  logo_image    = filebase64("lacework_logo.png")
  marketing_url = "https://www.lacework.com/" 
  web{
    homepage_url = "https://www.lacework.com" 
  }
}
resource "azuread_directory_role" "dir-reader" {
  #alternatively display_name = "Directory Reader" 
  template_id = "88d8e3e3-8f55-4a1e-953a-9b9898b8876b"
}

resource "azuread_directory_role_member" "lacework-dir-reader" {
  role_object_id   = azuread_directory_role.dir-reader.object_id
  member_object_id = azuread_group.readers.id
}

resource "azuread_service_principal" "lacework" {
  count          = var.create ? 1 : 0
  application_id = local.application_id
}
resource "azuread_group_member" "lacework-reader-member" {
  group_object_id  = azuread_group.readers.id
  #use service principal as object id, not appreg
  member_object_id = azuread_service_principal.lacework[0].object_id
}

resource "azuread_application_password" "client_secret" {
  count                 = var.create ? 1 : 0
  application_object_id = azuread_application.lacework[count.index].object_id
  end_date              = "2299-12-31T01:02:03Z"
  depends_on            = [azuread_service_principal.lacework]
}

## Now grant Reader permissions to the Azure Subscriptions or Management Groups
data "azurerm_subscription" "primary" {}

data "azurerm_subscriptions" "available" {}
resource "azurerm_role_assignment" "grant_reader_role_to_subscriptions" {
  count = var.create ? length(local.subscription_ids) : 0
  scope = "/subscriptions/${local.subscription_ids[count.index]}"

  principal_id         = local.service_principal_id
  role_definition_name = "Reader"
}

data "azurerm_management_group" "default" {
  count = var.use_management_group ? 1 : 0
  name  = var.management_group_id
}

resource "azurerm_role_assignment" "default" {
  count                = var.use_management_group ? 1 : 0
  scope                = data.azurerm_management_group.default[0].id
  principal_id         = local.service_principal_id
  role_definition_name = "Reader"
}
