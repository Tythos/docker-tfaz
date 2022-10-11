output "sp_url" {
  value = azurerm_container_registry.acr.login_server
}

output "sp_id" {
  value = azuread_service_principal.example-sp.application_id
}
  
output "sp_key" {
  value     = azuread_service_principal_password.example-spkey.value
  sensitive = true
}
