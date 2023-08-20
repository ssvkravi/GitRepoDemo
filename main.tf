
provider "azurerm" {
    features {}
}

variable "group_name" {}

variable "location" {
    default = "svkaz400-Demo3"
}

data "external" "example" {
    program = ["/bin/bash","script.sh"]

    query = {
        group_name = var.group_name
    }
}

resource "azurerm_resource_group" "example" {
    count = data.external.example.result.exists == "true" ? 0 : 1
    name = var.group_name
    location = var.location
}
