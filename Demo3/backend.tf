resource "aws_db_instance" "ghost" {}





































# resource "aws_db_instance" "ghost" {
#     allocated_storage                   = 20
#     auto_minor_version_upgrade          = "true"
#     availability_zone                   = "us-east-1d"
#     backup_retention_period             = 7
#     db_subnet_group_name                = "default-vpc-05f39513cf0e5de19"
#     engine                              = "mysql"
#     engine_version                      = "5.7.22"
#     iam_database_authentication_enabled = "false"
#     identifier                          = "ghost4pnwriders"
#     instance_class                      = "db.t2.medium"
#     license_model                       = "general-public-license"
#     name                                = "ghost"
#     option_group_name                   = "default:mysql-5-7"
#     parameter_group_name                = "default.mysql5.7"
#     port                                = 3306
#     publicly_accessible                 = "true"
#     skip_final_snapshot                 = "true"
#     storage_encrypted                   = "false"
#     storage_type                        = "gp2"
#     username                            = "pnwAdmin"
# }











##############################################
##              Azure Backend               ##
##############################################

# # Use to provision MySQL backend for ghost
# resource "azurerm_mysql_server" "ghost-be" {
#   name                = "ghost-backend"
#   location            = "${var.loc}"
#   resource_group_name = "${var.rg}"

#   sku {
#     name = "B_Gen4_2"
#     capacity = 2
#     tier = "Basic"
#     family = "Gen4"
#   }

#   storage_profile {
#     storage_mb = 5120
#     backup_retention_days = 7
#     geo_redundant_backup = "Disabled"
#   }

#   administrator_login = "${var.sqladmin}"
#   administrator_login_password = "${var.sqlpwd}"
#   version = "5.7"
#   ssl_enforcement = "Disabled"
# }

# resource "azurerm_mysql_database" "ghost" {
#   name                = "ghost"
#   resource_group_name = "${var.rg}"
#   server_name         = "${azurerm_mysql_server.ghost-be.name}"
#   charset             = "utf8"
#   collation           = "utf8_unicode_ci"
# }

# resource "azurerm_mysql_firewall_rule" "allow-ghost-fe" {
#   name                  = "allow-ghost-fe"
#   resource_group_name   = "${var.rg}"

#   server_name           = "${azurerm_mysql_server.ghost-be.name}"

#   start_ip_address      = "0.0.0.0"     # Allow only internal Azure IP
#   end_ip_address        = "0.0.0.0"     # Allow only internal Azure IP
# }
