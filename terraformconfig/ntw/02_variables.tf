######################################################
# Variables
######################################################

##############################################################
#Variable declaration for provider

variable "AzureSubscriptionID" {
  type        = string
  description = "The subscription id for the authentication in the provider"
}

variable "AzureSubscriptionMonitorID" {
  type        = string
  description = "The subscription id for monitoring resources for the authentication in the provider"
}

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



######################################################
# Data sources variables

variable "LawMonitorId" {
  type        = string
  description = "Id of the Log Analytics Workspace used for Monitoring"
}

variable "StaMonitorId" {
  type        = string
  description = "Id of the sto for logs. Must be in the same region as resource"
}

###################################
# tags

variable "mandatory_tags" {
  type = object({
    data_classification  = optional(string, null)
    operation_commitment = optional(string, null)
    usage                = optional(string, null)
    start_time           = optional(string, null)
    stop_time            = optional(string, null)

  })

  default = {}
  description = "Tag variable"
}

variable "optional_tags" {
  type = object({
    owner      = optional(string, "N/A")
    start_date = optional(string, "N/A")

  })
  default = {}
  description = "Tag variable"
}

variable "extra_tags" {
  type    = map(string)
  default = {}
  description = "Tag variable"
}


######################################################
# configuration variables



variable "VnetConfig" {
  type = map(object({
    AppName                 = optional(string, null)
    IsVnetCustom            = optional(bool, false)
    VnetCustomName          = optional(bool, null)
    VNetDiagSettingsEnabled = optional(bool, null)
    VNetAddressSpace        = string
    VnetDnsServers          = optional(list(string), null)
    VnetLocation            = optional(string, "eastus")
    VnetPeered              = optional(bool, false)
    VnetPrivate             = optional(bool, false)
    VnetObjectIndex         = optional(number, 1)
    


  }))

  description = "A map of object to define the Vnet"
}

variable "SubnetsConfig" {
  description = "A list of object to define the subnets"
  type = list(object({
    Name             = optional(string, null)
    AllowCustomName  = optional(bool, null)
    EnableNsg        = optional(bool, null)
    EnableNsgDiagSet = optional(bool, false)
    EnableFlowlogs   = optional(bool, false)
    delegation = optional(object({
      delegation_name            = string
      service_delegation_name    = string
      service_delegation_actions = list(string)
    }), null)
    Nsg = optional(object({
      Name = string
      Rules = map(object({
        Name                       = string
        Priority                   = number
        Direction                  = string
        Access                     = string
        Protocol                   = string
        SourcePortRange            = optional(string, null)
        SourcePortRanges           = optional(list(string), null)
        DestinationPortRange       = optional(string, null)
        DestinationPortRanges      = optional(list(string), null)
        SourceAddressPrefix        = optional(string, null)
        SourceAddressPrefixes      = optional(list(string), null)
        DestinationAddressPrefix   = optional(string, null)
        DestinationAddressPrefixes = optional(list(string), null)
      }))
    }))
  }))
}

######################################################
# virtual hub connectivity

variable "VirtualHubId" {
  type        = string
  description = "The virtual hub id"

}

variable "CustomRouteTableName" {
  type        = string
  description = "The custom route table to use"
  default = "defaultRouteTable"
}



