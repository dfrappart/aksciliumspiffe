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

data "azuread_group" "aksadmin" {
  display_name     = var.AKSAdminGroupName
  security_enabled = true
}

#############################################################################
#data source for monitoring and security

data "azurerm_resource_group" "lawdefenderrg" {
  #provider = azurerm.defendersubscription

  name = split("/", var.LawDefenderId)[4]

}

data "azurerm_log_analytics_workspace" "defenderlaw" {
  #provider = azurerm.defendersubscription

  name                = split("/", var.LawDefenderId)[8]
  resource_group_name = split("/", var.LawDefenderId)[4]
}

data "azurerm_resource_group" "lawmonitorrg" {
  #provider = azurerm.monitorsubscription

  name = split("/", var.LawMonitorId)[4]

}

data "azurerm_log_analytics_workspace" "monitorlaw" {
  #provider = azurerm.monitorsubscription

  name                = split("/", var.LawMonitorId)[8]
  resource_group_name = split("/", var.LawMonitorId)[4]
}

#Data source for the log storage

data "azurerm_storage_account" "STALog" {
  #provider = azurerm.monitorsubscription
  resource_group_name = data.azurerm_resource_group.lawmonitorrg.name
  name                = split("/", var.StaMonitorId)[8]
}

data "azurerm_key_vault" "SharedKv" {
  #provider = azurerm.defendersubscription

  name                = split("/", var.SharedKv)[8]
  resource_group_name = split("/", var.SharedKv)[4]
}


#############################################################################
#data source for vnet and subnet

data "azurerm_resource_group" "VnetRg" {
  for_each = var.AksConfig
  name     = each.value.AksVnetRgName
}
data "azurerm_virtual_network" "Vnet" {
  for_each            = var.AksConfig
  name                = each.value.AksVnetName
  resource_group_name = data.azurerm_resource_group.VnetRg[each.key].name
}

data "azurerm_subnet" "AksSubnet" {
  for_each             = var.AksConfig
  name                 = each.value.AksSubnet
  resource_group_name  = data.azurerm_resource_group.VnetRg[each.key].name
  virtual_network_name = data.azurerm_virtual_network.Vnet[each.key].name
}