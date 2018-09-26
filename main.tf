resource "azurerm_resource_group" "ig2018-rg" {
    name                    = "${var.rg}"
    location                = "${var.loc}"
    tags                    = "${var.tags}"
}

# resource "azurerm_traffic_manager_profile" "ig2018pnwrider" {
#   name                      = "ig2018pnwrider"
#   resource_group_name       = "${var.rg}"
#   traffic_routing_method    = "Weighted"

#   dns_config {
#     relative_name           = "ig2018pnwrider"
#     ttl                     = 100
#   }

#   monitor_config {
#     protocol                = "http"
#     port                    = 2368
#     path                    = "/"
#   }

#   tags                      = "${var.tags}"
# }