# LOCALS

locals {
  resource_group_name   = "${var.naming_prefix}-${random_integer.name_suffix.result}"
  app_service_plan_name = "${var.naming_prefix}-${random_integer.name_suffix.result}"
  app_service_name      = "${var.naming_prefix}-${random_integer.name_suffix.result}"
}

resource "random_integer" "name_suffix" {
  min = 10000
  max = 99999
}

# Azure App Service


resource "azurerm_resource_group" "rg_example" {
  name     = local.resource_group_name
  location = var.rg_location
}


resource "azurerm_service_plan" "example" {
  name = local.app_service_plan_name
  #resource_group_name = azurerm_resource_group.rg_example.bad_attribute
  resource_group_name = azurerm_resource_group.rg_example.name
  location            = azurerm_resource_group.rg_example.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}


resource "azurerm_linux_web_app" "example" {
  name                = local.app_service_name
  resource_group_name = azurerm_resource_group.rg_example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id
  https_only          = true

  site_config {}
}