## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.100.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.52.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.108.0 |
| <a name="provider_azurerm.monitorsubscription"></a> [azurerm.monitorsubscription](#provider\_azurerm.monitorsubscription) | 3.108.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.4.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vnet"></a> [vnet](#module\_vnet) | ../../../Terra-AZModuletest/Custom_Modules/IaaS_NTW_VNet/ | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.RG](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_virtual_hub_connection.peering_spoke](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub_connection) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |
| [azurerm_client_config.currentclientconfig](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_log_analytics_workspace.monitorlaw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/log_analytics_workspace) | data source |
| [azurerm_resource_group.lawmonitorrg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_storage_account.STALog](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |
| [http_http.myip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AzureClientID"></a> [AzureClientID](#input\_AzureClientID) | The application Id, taken from Azure AD app registration | `string` | n/a | yes |
| <a name="input_AzureClientSecret"></a> [AzureClientSecret](#input\_AzureClientSecret) | The Application secret | `string` | n/a | yes |
| <a name="input_AzureSubscriptionID"></a> [AzureSubscriptionID](#input\_AzureSubscriptionID) | The subscription id for the authentication in the provider | `string` | n/a | yes |
| <a name="input_AzureSubscriptionMonitorID"></a> [AzureSubscriptionMonitorID](#input\_AzureSubscriptionMonitorID) | The subscription id for monitoring resources for the authentication in the provider | `string` | n/a | yes |
| <a name="input_AzureTenantID"></a> [AzureTenantID](#input\_AzureTenantID) | The Azure AD tenant ID | `string` | n/a | yes |
| <a name="input_CustomRouteTableName"></a> [CustomRouteTableName](#input\_CustomRouteTableName) | The custom route table to use | `string` | `"defaultRouteTable"` | no |
| <a name="input_LawMonitorId"></a> [LawMonitorId](#input\_LawMonitorId) | Id of the Log Analytics Workspace used for Monitoring | `string` | n/a | yes |
| <a name="input_StaMonitorId"></a> [StaMonitorId](#input\_StaMonitorId) | Id of the sto for logs. Must be in the same region as resource | `string` | n/a | yes |
| <a name="input_SubnetsConfig"></a> [SubnetsConfig](#input\_SubnetsConfig) | A list of object to define the subnets | <pre>list(object({<br>    Name             = optional(string, null)<br>    AllowCustomName  = optional(bool, null)<br>    EnableNsg        = optional(bool, null)<br>    EnableNsgDiagSet = optional(bool, false)<br>    EnableFlowlogs   = optional(bool, false)<br>    delegation = optional(object({<br>      delegation_name            = string<br>      service_delegation_name    = string<br>      service_delegation_actions = list(string)<br>    }), null)<br>    Nsg = optional(object({<br>      Name = string<br>      Rules = map(object({<br>        Name                       = string<br>        Priority                   = number<br>        Direction                  = string<br>        Access                     = string<br>        Protocol                   = string<br>        SourcePortRange            = optional(string, null)<br>        SourcePortRanges           = optional(list(string), null)<br>        DestinationPortRange       = optional(string, null)<br>        DestinationPortRanges      = optional(list(string), null)<br>        SourceAddressPrefix        = optional(string, null)<br>        SourceAddressPrefixes      = optional(list(string), null)<br>        DestinationAddressPrefix   = optional(string, null)<br>        DestinationAddressPrefixes = optional(list(string), null)<br>      }))<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_VirtualHubId"></a> [VirtualHubId](#input\_VirtualHubId) | The virtual hub id | `string` | n/a | yes |
| <a name="input_VnetConfig"></a> [VnetConfig](#input\_VnetConfig) | A map of object to define the Vnet | <pre>map(object({<br>    AppName                 = optional(string, null)<br>    IsVnetCustom            = optional(bool, false)<br>    VnetCustomName          = optional(bool, null)<br>    VNetDiagSettingsEnabled = optional(bool, null)<br>    VNetAddressSpace        = string<br>    VnetDnsServers          = optional(list(string), null)<br>    VnetLocation            = optional(string, "eastus")<br>    VnetPeered              = optional(bool, false)<br>    VnetPrivate             = optional(bool, false)<br>    VnetObjectIndex         = optional(number, 1)<br>    <br><br><br>  }))</pre> | n/a | yes |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Tag variable | `map(string)` | `{}` | no |
| <a name="input_mandatory_tags"></a> [mandatory\_tags](#input\_mandatory\_tags) | Tag variable | <pre>object({<br>    data_classification  = optional(string, null)<br>    operation_commitment = optional(string, null)<br>    usage                = optional(string, null)<br>    start_time           = optional(string, null)<br>    stop_time            = optional(string, null)<br><br>  })</pre> | `{}` | no |
| <a name="input_optional_tags"></a> [optional\_tags](#input\_optional\_tags) | Tag variable | <pre>object({<br>    owner      = optional(string, "N/A")<br>    start_date = optional(string, "N/A")<br><br>  })</pre> | `{}` | no |

## Outputs

No outputs.
