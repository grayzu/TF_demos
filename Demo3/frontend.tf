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

        # environment_variables {
        #     "database__client"                  = "mysql"
        #     "database__connection__host"        =  "${aws_db_instance.ghost.address}"   #"ghost4pnwriders.c2tgtuxyi63o.us-east-1.rds.amazonaws.com"           #"${azurerm_mysql_server.ghost-be.fqdn}"
        #     "database__connection__user"        =  "${aws_db_instance.ghost.username}"    #"pnwAdmin"           #"${var.sqladmin}@${var.mysql}"
        #     "database__connection__password"    =  "${var.sqlpwd}"
        #     "database__connection__database"    =  "${aws_db_instance.ghost.name}"   #"ghost"
        # }
    }

    container {
        name                    = "sidecar"
        image                   = "grayzu/envoyproxy-sidecar"
        cpu                     = "0.5"
        memory                  = "1.0"
        port                    = "80"
    }
}