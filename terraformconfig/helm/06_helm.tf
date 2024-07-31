
/*
resource "helm_release" "prom" {
  name             = "prometheus-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = "kube-system"
  create_namespace = false

  values = [
    "${file("./ciliumprom.yaml")}"
  ]

  depends_on = [
    helm_release.Cilium
  ]
}
*/

resource "helm_release" "Cilium" {
  name             = "cilium"
  repository       = "https://helm.cilium.io/"
  chart            = "cilium"
  version          = var.CiliumChartVer
  namespace        = "kube-system"
  create_namespace = false
  dynamic "set" {
    for_each = var.HelmCiliumParam
    content {
      name  = set.value.ParamName
      value = set.value.ParamValue
    }
  }



  depends_on = [

  ]
}
