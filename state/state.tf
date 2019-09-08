resource "azurerm_resource_group" "testrg" {
  name     = "hashiconf-terraform-state-rg"
  location = "westus2"
}

resource "azurerm_storage_account" "testsa" {
  name                     = "hashiconfdemotfstate"
  resource_group_name      = "${azurerm_resource_group.testrg.name}"
  location                 = "westus2"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
