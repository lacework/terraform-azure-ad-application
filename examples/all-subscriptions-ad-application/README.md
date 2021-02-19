# AD Application to Integrate Azure Tenant and All Subscriptions 
The following example shows how to deploy a new Azure AD application to integrate an Azure Tenant and all subscriptions with Lacework.
```hcl
terraform {
  required_providers {
    lacework = {
      source = "lacework/lacework"
    }
  }
}

provider "azuread" {}

provider "azurerm" {
  features {}
}

provider "lacework" {}

module "ad_application" {
  source            = "lacework/ad-application/azure"
  version           = "~> 0.1.2"
  all_subscriptions = true
}
```

For detailed information on integrating Lacework with Azure see [Azure Compliance & Activity Log Integrations - Terraform From Any Supported Host](https://support.lacework.com/hc/en-us/articles/360058966313-Azure-Compliance-Activity-Log-Integrations-Terraform-From-Any-Supported-Host)