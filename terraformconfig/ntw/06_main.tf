#######################################################
# Base resources

resource "azurerm_resource_group" "RG" {
  for_each = var.VnetConfig
  name     = "rsg-${each.key}"
  location = each.value.VnetLocation
}

