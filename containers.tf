resource "azurerm_container_group" "example" {
  name                = "example-continst"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  ip_address_type     = "Public"
  dns_name_label      = "docker-tf-az"
  os_type             = "Linux"

  image_registry_credential {
    username = azuread_service_principal.acr_puller_sp.application_id
    password = azuread_service_principal_password.acr_puller_sp_key.value
    server   = azurerm_container_registry.acr.login_server
  }

  container {
    name   = "mytest"
    image  = "${azurerm_container_registry.acr.login_server}/mytest:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}
