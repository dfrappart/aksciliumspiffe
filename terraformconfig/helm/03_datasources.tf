#############################################################################
#This file is used to define data source refering to Azure existing resources
#############################################################################


#############################################################################
#data source for the subscription


data "azurerm_subscription" "current" {}

data "azurerm_client_config" "currentclientconfig" {}


data "azurerm_kubernetes_cluster" "AKSCluster" {
  name                = split("/",var.AksClusterId)[8]
  resource_group_name = split("/",var.AksClusterId)[4]
}


