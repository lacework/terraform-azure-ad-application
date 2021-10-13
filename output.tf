output "created" {
  value       = var.create
  description = "Was the Active Directory Application created"
}

output "application_password" {
  value       = local.application_password
  description = "The Lacework AD Application password"
  sensitive   = true
}

output "application_id" {
  value       = local.application_id
  description = "The Lacework AD Application id"
}

output "service_principal_id" {
  value       = local.service_principal_id
  description = "The Lacework Service Principal id"
}

# @afiune We should remove these deprecations in a couple of months
# https://github.com/lacework/terraform-azure-ad-application/issues/30
output "tenant_id" {
  value       = var.tenant_id
  description = "[DEPRECATED] A Tenant ID used to configure the AD Application"
}
