##############################################
##              Basic Demo                  ##
##                                          ##
##  Provision Ghost Blog as ACI instance    ##
##           https://ghost.org/             ##
##############################################

resource "azurerm_resource_group" "ghost-rg" {
    name                    = "${var.name}-${var.environment}-rg"
    location                = var.loc
    tags                    = var.tags
}

resource "azurerm_container_group" "ghost" {
    name                        = "ghost"
    location                    = var.loc
    resource_group_name         = azurerm_resource_group.ghost-rg.name
    dns_name_label              = "${var.name}-ghost-${var.environment}"
    ip_address_type             = "public"
    os_type                     = "linux"
    tags                        = var.tags

    container {
        name                    = "ghost-blog"
        image                   = "ghost:alpine"
        cpu                     = "0.5"
        memory                  = "1.0"
        ports {
            port                = 2368
            protocol            = "TCP"
        }
    }
}