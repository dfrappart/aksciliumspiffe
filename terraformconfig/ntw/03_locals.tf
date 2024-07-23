locals {

    RouteTableId = format("%s%s%s", var.VirtualHubId, "/hubRouteTables/", var.CustomRouteTableName)
    PropagatedRoute = var.CustomRouteTableName == "defaultRouteTable" ? format("%s%s%s", var.VirtualHubId, "/hubRouteTables/", var.CustomRouteTableName) : format("%s%s%s", var.VirtualHubId, "/hubRouteTables/", "noneRouteTable")
    RouteLabel = var.CustomRouteTableName == "defaultRouteTable" ? "default" : "none"
}