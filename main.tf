

data "external" "rg_groupName" {
    program = ["/bin/bash","script.sh"]

    query = {
        group_name = var.group_name
    }
}
resource "azurerm_resource_group" "rg_groupName" {
  count = data.external.rg_groupName.result.exists == "true" ? 0 : 1
  name     = var.rg_name
  location = var.rg_location

}



provider "azurerm" {
    features {}
}

variable "group_name" {}

variable "location" {
    default = "eastus"
}

data "external" "example" {
    program = ["/bin/bash","./script.sh"]

    query = {
        group_name = var.group_name
    }
}

resource "azurerm_resource_group" "example" {
    count = data.external.example.result.exists == "true" ? 0 : 1
    name = var.group_name
    location = var.location
}


