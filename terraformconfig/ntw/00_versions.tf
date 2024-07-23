######################################################################
# backend block for partial configuration
######################################################################

terraform {
  required_version = ">= 1.8.0"

  required_providers {
    azurerm = {
      version = ">= 3.100.0"
    }



  }

  backend "azurerm" {}
}
