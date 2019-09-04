
##############################################
##              Roles Demo                  ##
##                                          ##
##  Same demo with breaking out by role     ##
##  to make management easier               ##
##############################################

resource "azurerm_container_group" "ghost" {
    name                        = "ghost"
    location                    = var.loc
    resource_group_name         = azurerm_resource_group.ghost-rg.name
    dns_name_label              = "pnw-mtb-rider"
    ip_address_type             = "public"
    os_type                     = "linux"
    tags                        = var.tags

    container {
        name                    = "ghost-blog"
        image                   = "ghost:alpine"
        cpu                     = "0.5"
        memory                  = "1.0"
    }

    container {
        name                    = "sidecar"
        image                   = "grayzu/envoyproxy-sidecar"
        cpu                     = "0.5"
        memory                  = "1.0"
        ports {
            port                = 80
            protocol            = "TCP"
        }
    }
}