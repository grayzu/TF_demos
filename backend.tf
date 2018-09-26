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
  ssl_enforcement = "Disabled"
}

resource "azurerm_mysql_database" "ghost" {
  name                = "ghost"
  resource_group_name = "${var.rg}"
  server_name         = "${azurerm_mysql_server.ghost-be.name}"
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

resource "azurerm_mysql_firewall_rule" "allow-ghost-fe" {
  name                  = "allow-ghost-fe"
  resource_group_name   = "${var.rg}"

  server_name           = "${azurerm_mysql_server.ghost-be.name}"

  start_ip_address      = "0.0.0.0"
  end_ip_address        = "255.255.255.255"
}
