
output "akscluster" {
  value     = data.azurerm_kubernetes_cluster.AKSCluster.fqdn
  sensitive = false
}