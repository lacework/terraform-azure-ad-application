# Default AD Application to Integrate Azure Tenant and Default Subscription
The following example shows how to deploy a new Azure AD application to integrate an Azure Tenant and select subscriptions with Lacework. This example provides examples of configuring the integration with module inputs.

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
  source  = "lacework/ad-application/azure"
  version = "~> 0.1.2"
}
```

For detailed information on integrating Lacework with Azure see [Azure Compliance & Activity Log Integrations - Terraform From Any Supported Host](https://support.lacework.com/hc/en-us/articles/360058966313-Azure-Compliance-Activity-Log-Integrations-Terraform-From-Any-Supported-Host)
