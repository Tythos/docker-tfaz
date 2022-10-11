output "sp_key" {
  value     = azuread_service_principal_password.example-spkey.value
  sensitive = true
}
