

module "vnet" {
  source = "../../../Terra-AZModuletest/Custom_Modules/IaaS_NTW_VNet/"

  for_each               = var.VnetConfig
  RgName                 = azurerm_resource_group.RG[each.key].name
  CustomVnet             = each.value.IsVnetCustom
  AppName                = each.value.AppName
  EnableVnetDiagSettings = true
  LawLogId               = var.LawMonitorId
  StaLogId               = var.StaMonitorId
  ObjectIndex            = each.value.VnetObjectIndex 


  Vnet = {
    AddressSpace = each.value.VNetAddressSpace
  }

  Subnets = var.SubnetsConfig
}

