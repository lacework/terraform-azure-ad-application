<a href="https://lacework.com"><img src="https://techally-content.s3-us-west-1.amazonaws.com/public-content/lacework_logo_full.png" width="600"></a>

# terraform-azure-ad-application

[![GitHub release](https://img.shields.io/github/release/lacework/terraform-azure-ad-application.svg)](https://github.com/lacework/terraform-azure-ad-application/releases/)
[![Codefresh build status](https://g.codefresh.io/api/badges/pipeline/lacework/terraform-modules%2Ftest-compatibility?type=cf-1&key=eyJhbGciOiJIUzI1NiJ9.NWVmNTAxOGU4Y2FjOGQzYTkxYjg3ZDEx.RJ3DEzWmBXrJX7m38iExJ_ntGv4_Ip8VTa-an8gBwBo)](https://g.codefresh.io/pipelines/edit/new/builds?id=607e25e6728f5a6fba30431b&pipeline=test-compatibility&projects=terraform-modules&projectId=607db54b728f5a5f8930405d)

Terraform module that creates an Azure Active Directory Application to provide Lacework read-only access to Azure Subscriptions and Tenants.
Lacework logins to Azure using a service principal (an App Registration) with Directory.Read.All on [MS Graph API](https://docs.microsoft.com/en-us/graph/api/user-list?view=graph-rest-1.0&tabs=http#permissions) which can also be achieved using a [Directory Reader role on Azure AD](https://docs.microsoft.com/en-us/azure/active-directory/roles/permissions-reference#directory-readers)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 2.25 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | ~> 2.25 |

## Resources

| Name | Type |
|------|------|
| [azuread_application.lacework](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_application_password.client_secret](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_password) | resource |
| [azuread_directory_role.dir_reader](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/directory_role) | resource |
| [azuread_directory_role_assignment.lacework_dir_reader](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/directory_role_assignment) | resource |
| [azuread_service_principal.lacework](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_all_subscriptions"></a> [all\_subscriptions](#input\_all\_subscriptions) | [DEPRECATED] Use this input on upstream modules. (<https://registry.terraform.io/modules/lacework/config/azure/latest?tab=inputs> and <https://registry.terraform.io/modules/lacework/activity-log/azure/latest?tab=inputs>) | `bool` | `false` | no |
| <a name="input_application_identifier_uris"></a> [application\_identifier\_uris](#input\_application\_identifier\_uris) | [DEPRECATED] A list of user-defined URI(s) for the Lacework AD Application | `list(string)` | `[]` | no |
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | The name of the Azure Active Directory Application | `string` | `"lacework_security_audit"` | no |
| <a name="input_application_owners"></a> [application\_owners](#input\_application\_owners) | The owners of the Azure Active Directory Application. If empty, current user will be owner | `list(string)` | `[]` | no |
| <a name="input_create"></a> [create](#input\_create) | Set to `false` to prevent the module from creating any resources | `bool` | `true` | no |
| <a name="input_key_vault_ids"></a> [key\_vault\_ids](#input\_key\_vault\_ids) | [DEPRECATED] A list of Key Vault Ids used in your subscription for the Lacework AD App to have access to | `list(string)` | `[]` | no |
| <a name="input_management_group_id"></a> [management\_group\_id](#input\_management\_group\_id) | [DEPRECATED] Use this input on upstream module: <https://registry.terraform.io/modules/lacework/config/azure/latest?tab=inputs> | `string` | `""` | no |
| <a name="input_password_length"></a> [password\_length](#input\_password\_length) | [DEPRECATED] The length of the Lacework AD Application password | `number` | `30` | no |
| <a name="input_subscription_ids"></a> [subscription\_ids](#input\_subscription\_ids) | [DEPRECATED] Use this input on upstream modules. (<https://registry.terraform.io/modules/lacework/config/azure/latest?tab=inputs> and <https://registry.terraform.io/modules/lacework/activity-log/azure/latest?tab=inputs>) | `list(string)` | `[]` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | [DEPRECATED] A Tenant ID different from the default defined inside the provider | `string` | `""` | no |
| <a name="input_use_management_group"></a> [use\_management\_group](#input\_use\_management\_group) | [DEPRECATED] Use this input on upstream module: <https://registry.terraform.io/modules/lacework/config/azure/latest?tab=inputs> | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_id"></a> [application\_id](#output\_application\_id) | The Lacework AD Application id |
| <a name="output_application_password"></a> [application\_password](#output\_application\_password) | The Lacework AD Application password |
| <a name="output_created"></a> [created](#output\_created) | Was the Active Directory Application created |
| <a name="output_service_principal_id"></a> [service\_principal\_id](#output\_service\_principal\_id) | The Lacework Service Principal id |
| <a name="output_tenant_id"></a> [tenant\_id](#output\_tenant\_id) | [DEPRECATED] A Tenant ID used to configure the AD Application |
