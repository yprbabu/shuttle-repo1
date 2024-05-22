variable "rgname" {}
variable "location" {}
variable "aspname" {}
variable "webappname" {}

resource "azurerm_resource_group" "rg" {
    name=var.rgname
    location = var.location

  
}

resource "azurerm_app_service_plan" "appserviceplan" {
  name = var.aspname
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind = "Linux"
  reserved=true

  sku {
    tier = "Standard"
    size = "S1"

  }

  resource "azurerm_app_service" "webapp" {
    name=var.webappname
    location=azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    app_service_plan_id=azurerm_app_service_plan.appserviceplan..id
  }

}
  
