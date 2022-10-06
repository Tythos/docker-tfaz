data "azuread_client_config" "current" {}

resource "azuread_application" "dockertfaz-app" {
  display_name = "dockertfaz-app"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "acr_puller_sp" {
  application_id               = azuread_application.dockertfaz-app.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal_password" "acr_puller_sp_key" {
  service_principal_id = azuread_service_principal.acr_puller_sp.object_id
}

resource "azuread_app_role_assignment" "acr_puller_sp_ra" {
  app_role_id         = azurerm_container_registry.acr.app_role_ids["Contributor"]
  principal_object_id = azuread_service_principal.acr_puller_sp.object_id
  resource_object_id  = azurerm_container_registry.acr.id
}
