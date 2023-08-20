

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


