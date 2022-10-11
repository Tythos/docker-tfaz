resource "azurerm_container_group" "example" {
  name                = "example-continst"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  ip_address_type     = "Public"
  dns_name_label      = "docker-tf-az"
  os_type             = "Linux"

  image_registry_credential {
    username = "docker-tfaz-sp"
    password = azuread_service_principal_password.example-spkey.value
    server   = "dockertfazacr.acurecr.io"
  }

  container {
    name   = "mytest"
    image  = "${azurerm_container_registry.acr.login_server}/mytest:latest"
    cpu    = "1.0"
    memory = "1.0"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}
