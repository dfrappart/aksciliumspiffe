

resource "azurerm_virtual_hub_connection" "peering_spoke" {

  for_each = { for k, v in var.VnetConfig : k => v if v.VnetPeered }
  name                      = format("peer-%s-to-%s", module.vnet[each.key].VNetFullOutput.name, split("/",var.VirtualHubId)[8])
  virtual_hub_id            = var.VirtualHubId
  remote_virtual_network_id = module.vnet[each.key].VNetFullOutput.id

  internet_security_enabled = false
  routing {
    associated_route_table_id = local.RouteTableId
    propagated_route_table {
      route_table_ids = [local.PropagatedRoute]
      labels          = [local.RouteLabel]
    }
  }

}