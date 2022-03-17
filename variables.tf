variable "create" {
  type        = bool
  default     = true
  description = "Set to `false` to prevent the module from creating any resources"
}

variable "application_name" {
  type        = string
  default     = "lacework_security_audit"
  description = "The name of the Azure Active Directory Application"
}

# @afiune We should remove these deprecations in a couple of months
# https://github.com/lacework/terraform-azure-ad-application/issues/30
variable "application_identifier_uris" {
  type        = list(string)
  description = "[DEPRECATED] A list of user-defined URI(s) for the Lacework AD Application"
  default     = []
}

variable "subscription_ids" {
  type        = list(string)
  description = "[DEPRECATED] Use this input on upstream modules. (https://registry.terraform.io/modules/lacework/config/azure/latest?tab=inputs and https://registry.terraform.io/modules/lacework/activity-log/azure/latest?tab=inputs)"
  default     = []
}

variable "all_subscriptions" {
  type        = bool
  default     = false
  description = "[DEPRECATED] Use this input on upstream modules. (https://registry.terraform.io/modules/lacework/config/azure/latest?tab=inputs and https://registry.terraform.io/modules/lacework/activity-log/azure/latest?tab=inputs)"
}

variable "tenant_id" {
  type        = string
  default     = ""
  description = "[DEPRECATED] A Tenant ID different from the default defined inside the provider"
}

variable "password_length" {
  type        = number
  default     = 30
  description = "[DEPRECATED] The length of the Lacework AD Application password"
}

# If some of the subscriptions use Key Vault services, we need to the
# Azure App to have access to each Key Vault used in your subscriptions.
variable "key_vault_ids" {
  type        = list(string)
  description = "[DEPRECATED] A list of Key Vault Ids used in your subscription for the Lacework AD App to have access to"
  default     = []
}
variable "use_management_group" {
  type        = bool
  default     = false
  description = "[DEPRECATED] Use this input on upstream module: https://registry.terraform.io/modules/lacework/config/azure/latest?tab=inputs"
}

variable "management_group_id" {
  type        = string
  default     = ""
  description = "[DEPRECATED] Use this input on upstream module: https://registry.terraform.io/modules/lacework/config/azure/latest?tab=inputs"
}
