##############################################
##       Config requirements                ##
##                                          ##
##  Config requires TF 0.12 and AzureRM     ##
##  provider version 1.33 or greater        ##
##  configure Azure backend remote state    ##
##############################################

terraform {
  required_version = ">= 0.12.0"
  # backend "azurerm" {}
}

provider "azurerm" {
  version = "~>1.33"
}