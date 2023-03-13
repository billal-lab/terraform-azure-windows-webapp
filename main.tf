provider "azurerm" {
  alias = "azurerm"
  features {}
}

locals {
  os_type = "Windows"
}

# create resource group if needed
resource "azurerm_resource_group" "rg_to_create" {
    provider = azurerm.azurerm
    count = var.create_rg ? 1 : 0
    name     = "rg-${var.client_name}-${var.environnement}"
    location = "${var.location}"
    tags = {
      "client" = "${var.client_name}"
    }
}

# retreive resource group
data "azurerm_resource_group" "rg-to-use" {
    provider = azurerm.azurerm
    name = "rg-${var.client_name}-${var.environnement}"
    depends_on = [
        azurerm_resource_group.rg_to_create
    ]
}

# create app service plan
resource "azurerm_service_plan" "asp" {
    provider = azurerm.azurerm
    name                = "asp-${var.client_name}-${var.environnement}"
    location            = var.location
    resource_group_name = data.azurerm_resource_group.rg-to-use.name
    sku_name            = var.sku_name
    os_type = local.os_type
    depends_on = [
      data.azurerm_resource_group.rg-to-use
    ]
}

# create web app

resource "azurerm_windows_web_app" "webapp" {
    provider = azurerm.azurerm
    name                = "webapp-${var.client_name}-${var.environnement}"
    location            = "${var.location}"
    resource_group_name = data.azurerm_resource_group.rg-to-use.name
    service_plan_id = "${azurerm_service_plan.asp.id}"
    app_settings = var.app_settings
    site_config {
        always_on = false
    }
    depends_on = [
      azurerm_service_plan.asp
    ]
}


