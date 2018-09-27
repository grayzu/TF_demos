resource "azurerm_resource_group" "ig2018-rg" {
    name                    = "${var.rg}"
    location                = "${var.loc}"
    tags                    = "${var.tags}"
}

resource "azurerm_container_group" "ghost" {
    name                        = "ghost"
    location                    = "${var.loc}"
    resource_group_name         = "${azurerm_resource_group.ig2018-rg.name}"
    dns_name_label              = "ig2018pnwrider"
    ip_address_type             = "public"
    os_type                     = "linux"
    tags                        = "${var.tags}"

    container {
        name                    = "ghost-blog"
        image                   = "ghost:alpine"
        cpu                     = "0.5"
        memory                  = "1.0"
    }
}