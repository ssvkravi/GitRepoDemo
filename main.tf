resource "azurerm_resource_group" "rg_groupName" {
  name     = var.rg_name
  location = var.rg_location

}