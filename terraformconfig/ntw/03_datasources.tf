#############################################################################
#This file is used to define data source refering to Azure existing resources
#############################################################################


#############################################################################
#data source for the subscription


data "azurerm_subscription" "current" {}

data "azurerm_client_config" "currentclientconfig" {}

#############################################################################
#data source for azure ad owners

data "azuread_client_config" "current" {}


#############################################################################
#data source for monitoring and security

data "azurerm_resource_group" "lawmonitorrg" {
  provider = azurerm.monitorsubscription

  name = split("/", var.LawMonitorId)[4]

}

data "azurerm_log_analytics_workspace" "monitorlaw" {
  provider = azurerm.monitorsubscription

  name                = split("/", var.LawMonitorId)[8]
  resource_group_name = split("/", var.LawMonitorId)[4]
}

#Data source for the log storage

data "azurerm_storage_account" "STALog" {
  provider = azurerm.monitorsubscription
  resource_group_name = data.azurerm_resource_group.lawmonitorrg.name
  name                = split("/", var.StaMonitorId)[8]
}


data "http" "myip" {
  url = "https://ifconfig.me"
}



