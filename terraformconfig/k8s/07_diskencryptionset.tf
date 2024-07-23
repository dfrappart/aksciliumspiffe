# Disk Encryption Set

resource "azurerm_user_assigned_identity" "AksDesUai" {
  for_each = var.AksConfig

  location            = azurerm_resource_group.RG[each.key].location
  name                = format("uai-%s-%s", "aksdes", each.key)
  resource_group_name = azurerm_resource_group.RG[each.key].name
}



resource "azurerm_role_assignment" "UaiDesAksReader" {
  for_each             = var.AksConfig
  scope                = azurerm_resource_group.RG[each.key].id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.AksDesUai[each.key].principal_id
}

resource "azurerm_key_vault_key" "AksDesKey" {
  #provider     = azurerm.defendersubscription
  for_each     = var.AksConfig
  name         = replace("des-aks-key${each.key}", ".", "")
  key_vault_id = data.azurerm_key_vault.SharedKv.id
  key_type     = "RSA"
  key_size     = 4096

  depends_on = [
  ]

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]


}

resource "azurerm_disk_encryption_set" "AKSEncryptionSet" {
  for_each                  = var.AksConfig
  name                      = "des-aks-${each.key}"
  resource_group_name       = azurerm_resource_group.RG[each.key].name
  location                  = azurerm_resource_group.RG[each.key].location
  key_vault_key_id          = azurerm_key_vault_key.AksDesKey[each.key].versionless_id
  auto_key_rotation_enabled = true
  encryption_type           = "EncryptionAtRestWithCustomerKey"

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.AksDesUai[each.key].id
    ]
  }


}

# Access Policy for AKS Disk Encryption set

resource "azurerm_key_vault_access_policy" "AKSDESAccessPolicy" {
  #provider = azurerm.defendersubscription
  for_each = var.AksConfig


  key_vault_id = data.azurerm_key_vault.SharedKv.id
  tenant_id    = data.azurerm_client_config.currentclientconfig.tenant_id
  object_id    = azurerm_user_assigned_identity.AksDesUai[each.key].principal_id

  key_permissions = var.Keyperms_AKSDesUAI_AccessPolicy

  depends_on = [
  ]
}
