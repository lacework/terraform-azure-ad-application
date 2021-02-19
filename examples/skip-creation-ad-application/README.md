# Skip Creation of AD Application to Integrate Azure Tenant
The following example shows how to use module inputs to skip the creation of the Azure AD Application.

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
  create  = false
}
```

For detailed information on integrating Lacework with Azure see [Azure Compliance & Activity Log Integrations - Terraform From Any Supported Host](https://support.lacework.com/hc/en-us/articles/360058966313-Azure-Compliance-Activity-Log-Integrations-Terraform-From-Any-Supported-Host)