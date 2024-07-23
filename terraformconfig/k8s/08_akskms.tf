# Access Policy for AKS Control plane UAI

resource "azurerm_key_vault_access_policy" "akskvkmsaccesspolicyAKS" {
  #provider = azurerm.defendersubscription

  for_each = var.AksConfig

  key_vault_id = data.azurerm_key_vault.SharedKv.id
  tenant_id    = data.azurerm_client_config.currentclientconfig.tenant_id
  object_id    = azurerm_user_assigned_identity.AksUai[each.key].principal_id

  key_permissions = var.Keyperms_AKSUAI_AccessPolicy

  depends_on = [
  ]
}

# Key used for encryption of etcd

resource "azurerm_key_vault_key" "akskmskey" {
  #provider = azurerm.defendersubscription
  for_each = var.AksConfig

  lifecycle {
    ignore_changes = [
      key_opts
    ]
  }

  name         = "akskmskey${azurerm_user_assigned_identity.AksUai[each.key].name}"
  key_vault_id = data.azurerm_key_vault.SharedKv.id
  key_type     = "RSA"
  key_size     = 4096

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]

  depends_on = [
  ]
}


