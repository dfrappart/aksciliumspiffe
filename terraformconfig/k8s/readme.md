## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.0 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | >=1.13 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 2.52 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.100.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | 1.13.1 |
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.52.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.109.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.5 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_AKS"></a> [AKS](#module\_AKS) | github.com/dfrappart/Terra-AZModuletest//Custom_Modules/IaaS_AKS_Cluster | aksv1.3.2 |

## Resources

| Name | Type |
|------|------|
| [azapi_update_resource.kube_proxy_disabled](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/update_resource) | resource |
| [azurerm_disk_encryption_set.AKSEncryptionSet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set) | resource |
| [azurerm_key_vault_access_policy.AKSDESAccessPolicy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.akskvkmsaccesspolicyAKS](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_key.AksDesKey](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key) | resource |
| [azurerm_key_vault_key.akskmskey](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key) | resource |
| [azurerm_resource_group.RG](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.AKSDESReader](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.AKSDNSContributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.AKSNetworkContributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.UaiDesAksReader](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_ssh_public_key.akssshtoazure](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/ssh_public_key) | resource |
| [azurerm_user_assigned_identity.AksDesUai](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_user_assigned_identity.AksUai](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [tls_private_key.akssshkey](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |
| [azuread_group.aksadmin](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azurerm_client_config.currentclientconfig](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_key_vault.SharedKv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_log_analytics_workspace.defenderlaw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/log_analytics_workspace) | data source |
| [azurerm_log_analytics_workspace.monitorlaw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/log_analytics_workspace) | data source |
| [azurerm_resource_group.VnetRg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_resource_group.lawdefenderrg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_resource_group.lawmonitorrg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_storage_account.STALog](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_subnet.AksSubnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |
| [azurerm_virtual_network.Vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AKSAdminGroupName"></a> [AKSAdminGroupName](#input\_AKSAdminGroupName) | Name of the aks admin group | `string` | n/a | yes |
| <a name="input_AKSPrivateDNSZoneId"></a> [AKSPrivateDNSZoneId](#input\_AKSPrivateDNSZoneId) | The private DNS zone Id for AKS Cluster | `string` | `"System"` | no |
| <a name="input_AksConfig"></a> [AksConfig](#input\_AksConfig) | A map of object to define the AKS cluster(s) | <pre>map(object({<br>    AzureRBACEnabled           = optional(bool, false)<br>    LocalAccountDisabled       = optional(bool, false)<br>    IsAKSPrivate               = optional(bool, false)<br>    PrivateClusterPublicFqdn   = optional(bool, false)<br>    IsBYOPrivateDNSZone        = optional(bool, false)<br>    EnabledForAgic             = optional(bool, false)<br>    CriticalAddonEnabled       = optional(bool, false)<br>    KMSEnabled                 = optional(bool, false)<br>    EnableHostEncryption       = optional(bool, true)<br>    CSISecretStoreENabled      = optional(bool, true)<br>    WorkloadIdentityEnabled    = optional(bool, true)<br>    AKSNetworkPlugin           = optional(string, "none")<br>    AKSNetPolProvider          = optional(string, null)<br>    NetworkPluginMode          = optional(string, null)<br>    EbpfDataplane              = optional(string, null)<br>    AksVnetName                = string<br>    AksVnetRgName              = string<br>    AksSubnet                  = string<br>    AksIlb                     = optional(string, null)<br>    PodCidr                    = optional(string, null)<br>    ServiceCidr                = optional(string, null)<br>    EnableKubeProxyReplacement = optional(bool, false)<br><br>  }))</pre> | n/a | yes |
| <a name="input_AzureADClientID"></a> [AzureADClientID](#input\_AzureADClientID) | The AAD Client ID | `string` | n/a | yes |
| <a name="input_AzureADClientSecret"></a> [AzureADClientSecret](#input\_AzureADClientSecret) | The AAD Application secret | `string` | n/a | yes |
| <a name="input_AzureClientID"></a> [AzureClientID](#input\_AzureClientID) | The application Id, taken from Azure AD app registration | `string` | n/a | yes |
| <a name="input_AzureClientSecret"></a> [AzureClientSecret](#input\_AzureClientSecret) | The Application secret | `string` | n/a | yes |
| <a name="input_AzureRegion"></a> [AzureRegion](#input\_AzureRegion) | The region for the Azure resource | `string` | `"eastus"` | no |
| <a name="input_AzureSubscriptionID"></a> [AzureSubscriptionID](#input\_AzureSubscriptionID) | The subscription id for the authentication in the provider | `string` | n/a | yes |
| <a name="input_AzureTenantID"></a> [AzureTenantID](#input\_AzureTenantID) | The Azure AD tenant ID | `string` | n/a | yes |
| <a name="input_Certperms_TFApp_AccessPolicy"></a> [Certperms\_TFApp\_AccessPolicy](#input\_Certperms\_TFApp\_AccessPolicy) | The authorization on the secret for the Access policy | `list(any)` | <pre>[<br>  "Backup",<br>  "Create",<br>  "Delete",<br>  "DeleteIssuers",<br>  "Get",<br>  "GetIssuers",<br>  "Import",<br>  "List",<br>  "ListIssuers",<br>  "ManageContacts",<br>  "ManageIssuers",<br>  "Purge",<br>  "Recover",<br>  "Restore",<br>  "SetIssuers",<br>  "Update"<br>]</pre> | no |
| <a name="input_Keyperms_AKSDesUAI_AccessPolicy"></a> [Keyperms\_AKSDesUAI\_AccessPolicy](#input\_Keyperms\_AKSDesUAI\_AccessPolicy) | The authorization on the secret for the Access policy | `list(any)` | <pre>[<br>  "Create",<br>  "Delete",<br>  "Get",<br>  "Purge",<br>  "Recover",<br>  "Update",<br>  "List",<br>  "Decrypt",<br>  "Sign",<br>  "WrapKey",<br>  "UnwrapKey"<br>]</pre> | no |
| <a name="input_Keyperms_AKSUAI_AccessPolicy"></a> [Keyperms\_AKSUAI\_AccessPolicy](#input\_Keyperms\_AKSUAI\_AccessPolicy) | The authorization on the secret for the Access policy | `list(any)` | <pre>[<br>  "Decrypt",<br>  "Encrypt"<br>]</pre> | no |
| <a name="input_Keyperms_TFApp_AccessPolicy"></a> [Keyperms\_TFApp\_AccessPolicy](#input\_Keyperms\_TFApp\_AccessPolicy) | The authorization on the secret for the Access policy | `list(any)` | <pre>[<br>  "Backup",<br>  "Create",<br>  "Decrypt",<br>  "Delete",<br>  "Encrypt",<br>  "Get",<br>  "Import",<br>  "List",<br>  "Purge",<br>  "Recover",<br>  "Restore",<br>  "Sign",<br>  "UnwrapKey",<br>  "Update",<br>  "Verify",<br>  "WrapKey",<br>  "Release",<br>  "Rotate",<br>  "GetRotationPolicy",<br>  "SetRotationPolicy"<br>]</pre> | no |
| <a name="input_LawDefenderId"></a> [LawDefenderId](#input\_LawDefenderId) | Id of the Log Analytics Workspace used for Defender | `string` | n/a | yes |
| <a name="input_LawMonitorId"></a> [LawMonitorId](#input\_LawMonitorId) | Id of the Log Analytics Workspace used for Monitoring | `string` | n/a | yes |
| <a name="input_Secretperms_TFApp_AccessPolicy"></a> [Secretperms\_TFApp\_AccessPolicy](#input\_Secretperms\_TFApp\_AccessPolicy) | The authorization on the secret for the Access policy | `list(any)` | <pre>[<br>  "Backup",<br>  "Purge",<br>  "Recover",<br>  "Restore",<br>  "Get",<br>  "List",<br>  "Set",<br>  "Delete"<br>]</pre> | no |
| <a name="input_SharedKv"></a> [SharedKv](#input\_SharedKv) | The shared KV used to store keys | `string` | n/a | yes |
| <a name="input_StaMonitorId"></a> [StaMonitorId](#input\_StaMonitorId) | Id of the sto for logs. Must be in the same region as resource | `string` | n/a | yes |

## Outputs

No outputs.
