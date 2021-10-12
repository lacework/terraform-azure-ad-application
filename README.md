<a href="https://lacework.com"><img src="https://techally-content.s3-us-west-1.amazonaws.com/public-content/lacework_logo_full.png" width="600"></a>

# terraform-azure-ad-application

[![GitHub release](https://img.shields.io/github/release/lacework/terraform-azure-ad-application.svg)](https://github.com/lacework/terraform-azure-ad-application/releases/)
[![Codefresh build status](https://g.codefresh.io/api/badges/pipeline/lacework/terraform-modules%2Ftest-compatibility?type=cf-1&key=eyJhbGciOiJIUzI1NiJ9.NWVmNTAxOGU4Y2FjOGQzYTkxYjg3ZDEx.RJ3DEzWmBXrJX7m38iExJ_ntGv4_Ip8VTa-an8gBwBo)](https://g.codefresh.io/pipelines/edit/new/builds?id=607e25e6728f5a6fba30431b&pipeline=test-compatibility&projects=terraform-modules&projectId=607db54b728f5a5f8930405d)

Terraform module that creates an Azure Active Directory Application to provide Lacework read-only access to Azure Subscriptions and Tenants.

## Inputs

| Name                        | Description                                                                                                        | Type           | Default                     | Required |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------ | -------------- | --------------------------- | :------: |
| all_subscriptions           | (DEPRECATED) If set to `true`, grant read access to ALL subscriptions within the selected Tenant (overrides `subscription_ids`) | `bool`         | `false`                     |    no    |
| application_identifier_uris | A list of user-defined URI(s) for the Lacework AD Application                                                      | `list(string)` | `[]`                        |    no    |
| application_name            | The name of the Azure Active Directory Application                                                                 | `string`       | `"lacework_security_audit"` |    no    |
| create                      | (DEPRECATED) Set to `false` to prevent the module from creating any resources                                                   | `bool`         | `true`                      |    no    |
| key_vault_ids               | (DEPRECATED) A list of Key Vault Ids used in your subscription for the Lacework AD App to have access to                        | `list(string)` | `[]`                        |    no    |
| management_group_id         | (DEPRECATED) The ID of the Management Group                                                                                     | `string`       | `""`                        |    no    |
| password_length             | [DEPRECATED] The length of the Lacework AD Application password                                                    | `number`       | `30`                        |    no    |
| subscription_ids            | (DEPRECATED) List of subscriptions to grant read access to. By default the module will only use the primary subscription        | `list(string)` | `[]`                        |    no    |
| tenant_id                   | A Tenant ID different from the default defined inside the provider                                                 | `string`       | `""`                        |    no    |
| use_management_group        | (DEPRECATED) If set to `true`, the AD Application will be set up to leverage a Management Group                                 | `bool`         | `false`                     |    no    |

## Outputs

| Name                 | Description                                      |
| -------------------- | ------------------------------------------------ |
| application_id       | The Lacework AD Application id                   |
| application_password | The Lacework AD Application password             |
| created              | Was the Active Directory Application created     |
| service_principal_id | The Lacework Service Principal id                |
| tenant_id            | A Tenant ID used to configure the AD Application |
