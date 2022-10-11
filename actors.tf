resource "azuread_application" "example" {
  display_name = "example"
}

resource "azuread_service_principal" "example-sp" {
  application_id = azuread_application.example.application_id
}

resource "azuread_service_principal_password" "example-spkey" {
  service_principal_id = azuread_service_principal.example-sp.object_id
}
