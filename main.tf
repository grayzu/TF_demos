resource "azurerm_resource_group" "ig2018-rg" {
    name                    = "${var.rg}"
    location                = "${var.loc}"
    tags                    = "${var.tags}"
}