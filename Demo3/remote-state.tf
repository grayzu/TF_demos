terraform {
  backend "azurerm" {
    storage_account_name = "tfstate4pnwriders"
    container_name = "tfstate"
    key = "pnwriders.terraform.tfstate"
    access_key = "${var.backendkey}"
  }
}