
######################################################################
# Resource config for AKS

# UAI for AKS

resource "azurerm_user_assigned_identity" "AksUai" {
  for_each = var.AksConfig

  location            = azurerm_resource_group.RG[each.key].location
  name                = format("uai-%s-%s", "aks", each.key)
  resource_group_name = azurerm_resource_group.RG[each.key].name
}


# Required role for API Subnet integration

resource "azurerm_role_assignment" "AKSNetworkContributor" {
  for_each             = var.AksConfig
  scope                = data.azurerm_resource_group.VnetRg[each.key].id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.AksUai[each.key].principal_id
}

# Required role for Private Cluster with byo dns


resource "azurerm_role_assignment" "AKSDNSContributor" {
  #provider             = azurerm.dnssubscription
  for_each             = var.AksConfig
  scope                = var.AKSPrivateDNSZoneId
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = azurerm_user_assigned_identity.AksUai[each.key].principal_id

}

# Required role for encryption with disk encryption set

resource "azurerm_role_assignment" "AKSDESReader" {
  #provider             = azurerm.dnssubscription
  for_each             = var.AksConfig
  scope                = azurerm_resource_group.RG[each.key].id
  role_definition_name = "reader"
  principal_id         = azurerm_user_assigned_identity.AksUai[each.key].principal_id
}

# SSH key for AKS creation

resource "tls_private_key" "akssshkey" {
  for_each  = var.AksConfig
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_ssh_public_key" "akssshtoazure" {
  for_each            = var.AksConfig
  name                = substr(replace(replace("akssshkey${each.key}", "-", ""), ".", ""), 0, 24)
  resource_group_name = azurerm_resource_group.RG[each.key].name
  location            = var.AzureRegion
  public_key          = tls_private_key.akssshkey[each.key].public_key_openssh
}

# AKS Cluster

module "AKS" {
  for_each = var.AksConfig
  #Module Location
  source = "github.com/dfrappart/Terra-AZModuletest//Custom_Modules/IaaS_AKS_Cluster?ref=aksv1.3.2" #"../../../Terra-AZModuletest/Custom_Modules/IaaS_AKS_Cluster" #

  #Module variable


  AKSLocation                = azurerm_resource_group.RG[each.key].location
  AKSRGName                  = azurerm_resource_group.RG[each.key].name
  AKSSubnetId                = data.azurerm_subnet.AksSubnet[each.key].id
  AKSNetworkPlugin           = each.value.AKSNetworkPlugin
  AKSNetPolProvider          = each.value.AKSNetPolProvider
  AKSClusSuffix              = substr(replace(replace(each.key, ".", ""), "-", ""), 0, 12)
  AKSIdentityType            = "UserAssigned"
  UAIIds                     = [azurerm_user_assigned_identity.AksUai[each.key].id]
  PublicSSHKey               = tls_private_key.akssshkey[each.key].public_key_openssh
  AKSClusterAdminsIds        = [data.azuread_group.aksadmin.object_id]
  TaintCriticalAddonsEnabled = each.value.CriticalAddonEnabled

  IsDefenderEnabled = false
  IsOMSAgentEnabled = false

  EnableHostEncryption     = each.value.EnableHostEncryption
  IsAKSPrivate             = each.value.IsAKSPrivate
  PrivateClusterPublicFqdn = each.value.PrivateClusterPublicFqdn
  AzureRBACEnabled         = each.value.AzureRBACEnabled
  LocalAccountDisabled     = each.value.LocalAccountDisabled

  IsWorkloadIdentityEnabled = each.value.WorkloadIdentityEnabled
  IsCSIKVAddonEnabled       = each.value.CSISecretStoreENabled

  IsAKSKMSEnabled = each.value.KMSEnabled
  IsAGICEnabled   = each.value.EnabledForAgic

  MinAutoScaleCount = 3

  AKSPodCIDR           = each.value.PodCidr
  AKSSVCCIDR           = each.value.ServiceCidr
  AKSNetworkDNS        = each.value.ServiceCidr != null ? cidrhost(each.value.ServiceCidr, 10) : null
  AKSNetworkPluginMode = each.value.NetworkPluginMode
  AKSEbpfDataplane     = each.value.EbpfDataplane

  depends_on = [
    azurerm_role_assignment.AKSDNSContributor,
    #azurerm_firewall_policy_rule_collection_group.AKSFWRules
  ]

}

resource "azapi_update_resource" "kube_proxy_disabled" {
  for_each    = { for k, v in var.AksConfig : k => v if v.EnableKubeProxyReplacement }
  resource_id = module.AKS[each.key].KubeId
  type        = "Microsoft.ContainerService/managedClusters@2024-02-02-preview"
  body = jsonencode({
    properties = {
      networkProfile = {
        kubeProxyConfig = {
          enabled = false
        }
      }
    }
  })


}
