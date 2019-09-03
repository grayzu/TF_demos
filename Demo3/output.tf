
##############################################
##       Output important info              ##
##                                          ##
##  Show DNS address and IP of container    ##
##  MySQL FQDN                              ##
##############################################

output "dns" {
  value = azurerm_container_group.ghost.fqdn
}

output "public_ip" {
  value = azurerm_container_group.ghost.ip_address
}

output "be_db_fqdn" {
  value = azurerm_mysql_server.ghost-be.fqdn
}