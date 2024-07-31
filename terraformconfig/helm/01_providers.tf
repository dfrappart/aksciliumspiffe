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

provider "kubernetes" {

  host                   = data.azurerm_kubernetes_cluster.AKSCluster.kube_admin_config.0.host #module.AKSClus.KubeAdminCFG_HostName
  username               = data.azurerm_kubernetes_cluster.AKSCluster.kube_admin_config.0.username
  password               = data.azurerm_kubernetes_cluster.AKSCluster.kube_admin_config.0.password
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.AKSCluster.kube_admin_config.0.client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.AKSCluster.kube_admin_config.0.client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.AKSCluster.kube_admin_config.0.cluster_ca_certificate)

}


provider "helm" {
  kubernetes {

    host                   = data.azurerm_kubernetes_cluster.AKSCluster.kube_admin_config.0.host #module.AKSClus.KubeAdminCFG_HostName
    username               = data.azurerm_kubernetes_cluster.AKSCluster.kube_admin_config.0.username
    password               = data.azurerm_kubernetes_cluster.AKSCluster.kube_admin_config.0.password
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.AKSCluster.kube_admin_config.0.client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.AKSCluster.kube_admin_config.0.client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.AKSCluster.kube_admin_config.0.cluster_ca_certificate)

  }
}

