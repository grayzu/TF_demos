output "dns" {
  value = "${azurerm_container_group.ghost.fqdn}"
}

output "public_ip" {
  value = "${azurerm_container_group.ghost.ip_address}"
}
