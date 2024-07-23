######################################################
# Variables
######################################################

##############################################################
#Variable declaration for provider

variable "AzureSubscriptionID" {
  type        = string
  description = "The subscription id for the authentication in the provider"
}
/*
variable "AzureSubscriptionDefenderID" {
  type        = string
  description = "The subscription id for Azure Defender for the authentication in the provider"
}

variable "AzureSubscriptionDNSID" {
  type        = string
  description = "The subscription id for DNS Zones for the authentication in the provider"
}

/*
variable "AzureSubscriptionCloudShellID" {
  type        = string
  description = "The subscription id for cloud shell vnet integrated for the authentication in the provider"
}
*/
/*
variable "AzureSubscriptionMonitorID" {
  type        = string
  description = "The subscription id for monitoring resources for the authentication in the provider"
}
*/
variable "AzureClientID" {
  type        = string
  description = "The application Id, taken from Azure AD app registration"
}


variable "AzureClientSecret" {
  type        = string
  description = "The Application secret"

}

variable "AzureTenantID" {
  type        = string
  description = "The Azure AD tenant ID"
}


variable "AzureADClientSecret" {
  type        = string
  description = "The AAD Application secret"

}

variable "AzureADClientID" {
  type        = string
  description = "The AAD Client ID"
}


######################################################
# Data sources variables

variable "AKSAdminGroupName" {
  type        = string
  description = "Name of the aks admin group"
}

variable "LawDefenderId" {
  type        = string
  description = "Id of the Log Analytics Workspace used for Defender"
}

variable "LawMonitorId" {
  type        = string
  description = "Id of the Log Analytics Workspace used for Monitoring"
}

variable "StaMonitorId" {
  type        = string
  description = "Id of the sto for logs. Must be in the same region as resource"
}
######################################################
# Common variables

variable "AzureRegion" {
  type        = string
  description = "The region for the Azure resource"
  default     = "eastus"

}

######################################################
# KV variables

variable "Secretperms_TFApp_AccessPolicy" {
  type        = list(any)
  description = "The authorization on the secret for the Access policy"
  default = [
    "Backup",
    "Purge",
    "Recover",
    "Restore",
    "Get",
    "List",
    "Set",
    "Delete"
  ]

}

variable "Certperms_TFApp_AccessPolicy" {
  type        = list(any)
  description = "The authorization on the secret for the Access policy"
  default = [
    "Backup",
    "Create",
    "Delete",
    "DeleteIssuers",
    "Get",
    "GetIssuers",
    "Import",
    "List",
    "ListIssuers",
    "ManageContacts",
    "ManageIssuers",
    "Purge",
    "Recover",
    "Restore",
    "SetIssuers",
    "Update"
  ]

}

variable "Keyperms_TFApp_AccessPolicy" {
  type        = list(any)
  description = "The authorization on the secret for the Access policy"
  default = [
    "Backup",
    "Create",
    "Decrypt",
    "Delete",
    "Encrypt",
    "Get",
    "Import",
    "List",
    "Purge",
    "Recover",
    "Restore",
    "Sign",
    "UnwrapKey",
    "Update",
    "Verify",
    "WrapKey",
    "Release",
    "Rotate",
    "GetRotationPolicy",
    "SetRotationPolicy"
  ]

}

######################################################
# AKS KMS variables

variable "Keyperms_AKSUAI_AccessPolicy" {
  type        = list(any)
  description = "The authorization on the secret for the Access policy"
  default = [
    "Decrypt",
    "Encrypt"
  ]

}

######################################################
# AKS Disk Encryption Set variables

variable "Keyperms_AKSDesUAI_AccessPolicy" {
  type        = list(any)
  description = "The authorization on the secret for the Access policy"
  default = [
    "Create",
    "Delete",
    "Get",
    "Purge",
    "Recover",
    "Update",
    "List",
    "Decrypt",
    "Sign",
    "WrapKey",
    "UnwrapKey"
  ]

}

######################################################
# AKS Private DNS variables
variable "AKSPrivateDNSZoneId" {
  type        = string
  description = "The private DNS zone Id for AKS Cluster"
  default     = "System"
}

######################################################
# Shared KV variables
variable "SharedKv" {
  type        = string
  description = "The shared KV used to store keys"

}




######################################################
# Training



variable "AksConfig" {
  type = map(object({
    AzureRBACEnabled           = optional(bool, false)
    LocalAccountDisabled       = optional(bool, false)
    IsAKSPrivate               = optional(bool, false)
    PrivateClusterPublicFqdn   = optional(bool, false)
    IsBYOPrivateDNSZone        = optional(bool, false)
    EnabledForAgic             = optional(bool, false)
    CriticalAddonEnabled       = optional(bool, false)
    KMSEnabled                 = optional(bool, false)
    EnableHostEncryption       = optional(bool, true)
    CSISecretStoreENabled      = optional(bool, true)
    WorkloadIdentityEnabled    = optional(bool, true)
    AKSNetworkPlugin           = optional(string, "none")
    AKSNetPolProvider          = optional(string, null)
    NetworkPluginMode          = optional(string, null)
    EbpfDataplane              = optional(string, null)
    AksVnetName                = string
    AksVnetRgName              = string
    AksSubnet                  = string
    AksIlb                     = optional(string, null)
    PodCidr                    = optional(string, null)
    ServiceCidr                = optional(string, null)
    EnableKubeProxyReplacement = optional(bool, false)

  }))

  description = "A map of object to define the AKS cluster(s)"

}


