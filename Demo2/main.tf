
##############################################
##              Roles Demo                  ##
##                                          ##
##  Same demo with breaking out by role     ##
##  to make management easier               ##
##############################################

resource "azurerm_resource_group" "ghost-rg" {
  name     = "${var.name}-${var.environment}-rg"
  location = var.loc
  tags     = var.tags
}

