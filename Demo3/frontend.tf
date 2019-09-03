
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
        image                   = "ghost:latest"
        cpu                     = "0.5"
        memory                  = "1.0"

        environment_variables   = {
            "database__client"                  = "mysql"
            "database__connection__host"        =  azurerm_mysql_server.ghost-be.fqdn
            "database__connection__user"        =  "${var.sqladmin}@${var.mysql}"
            "database__connection__database"    =  var.dbname
        }

        secure_environment_variables = {
            "database__connection__password"    =  var.sqlpwd
        }
    }

    container {
        name                    = "sidecar"
        image                   = "grayzu/envoyproxy-sidecar"
        cpu                     = "0.5"
        memory                  = "1.0"
        port                    = "80"
    }
}