#######################################################
# Base resources

resource "azurerm_resource_group" "RG" {
  for_each = var.AksConfig
  name     = "rsg-${each.key}"
  location = var.AzureRegion
}
