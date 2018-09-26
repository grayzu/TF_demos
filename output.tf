output "dns" {
  value = "${azurerm_container_group.ghost.fqdn}"
}