## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.100.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.14 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >=2.30 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.109.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.14.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.prom](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [azurerm_client_config.currentclientconfig](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_kubernetes_cluster.AKSCluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_cluster) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AksClusterId"></a> [AksClusterId](#input\_AksClusterId) | The Id of the cluster | `string` | `""` | no |
| <a name="input_AzureClientID"></a> [AzureClientID](#input\_AzureClientID) | The application Id, taken from Azure AD app registration | `string` | n/a | yes |
| <a name="input_AzureClientSecret"></a> [AzureClientSecret](#input\_AzureClientSecret) | The Application secret | `string` | n/a | yes |
| <a name="input_AzureSubscriptionID"></a> [AzureSubscriptionID](#input\_AzureSubscriptionID) | The subscription id for the authentication in the provider | `string` | n/a | yes |
| <a name="input_AzureTenantID"></a> [AzureTenantID](#input\_AzureTenantID) | The Azure AD tenant ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_akscluster"></a> [akscluster](#output\_akscluster) | n/a |
