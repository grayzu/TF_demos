# Use to provision MySQL backend for ghost
resource "azurerm_mysql_server" "ghost-be" {
  name                = "ghost-backend"
  location            = "${var.loc}"
  resource_group_name = "${var.rg}"

  sku {
    name = "B_Gen4_2"
    capacity = 2
    tier = "Basic"
    family = "Gen4"
  }

  storage_profile {
    storage_mb = 5120
    backup_retention_days = 7
    geo_redundant_backup = "Disabled"
  }

  administrator_login = "${var.sqladmin}"
  administrator_login_password = "${var.sqlpwd}"
  version = "5.7"
  ssl_enforcement = "Enabled"
}