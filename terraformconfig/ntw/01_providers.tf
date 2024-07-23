######################################################################
# Access to Azure
######################################################################

provider "azurerm" {
  subscription_id = var.AzureSubscriptionID
  client_id       = var.AzureClientID
  client_secret   = var.AzureClientSecret
  tenant_id       = var.AzureTenantID

  features {
    resource_group {

      prevent_deletion_if_contains_resources = false

    }
  }

}

provider "azurerm" {
  subscription_id = var.AzureSubscriptionMonitorID
  client_id       = var.AzureClientID
  client_secret   = var.AzureClientSecret
  tenant_id       = var.AzureTenantID

  alias = "monitorsubscription"
  features {}

}



