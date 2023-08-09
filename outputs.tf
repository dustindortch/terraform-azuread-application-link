output "application_id" {
  value = azuread_service_principal.link.application_id
}

output "assignments" {
  value = azuread_app_role_assignment.assignments
}

output "id" {
  value = azuread_service_principal.link.id
}

output "logo_url" {
  value = azuread_application.link.logo_url
}

output "name" {
  value = azuread_service_principal.link.display_name
}

output "tenant_id" {
  value = azuread_service_principal.link.application_tenant_id
}

output "url" {
  value = azuread_service_principal.link.login_url
}
