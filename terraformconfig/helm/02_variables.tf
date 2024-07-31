######################################################
# Variables
######################################################

##############################################################
#Variable declaration for provider

variable "AzureSubscriptionID" {
  type        = string
  description = "The subscription id for the authentication in the provider"
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

variable "AksClusterId" {
  type        = string
  description = "The Id of the cluster"

}

variable "CiliumChartVer" {
  type        = string
  description = "The version of the chart"
  default     = "1.16.0"
}

variable "HelmCiliumParam" {
  type = map(object({
    ParamName  = string
    ParamValue = string


  }))
  description = "A map used to feed the dynamic blocks of the cert manager helm chart"
  default = {

    "set1" = {
      ParamName  = "hubble.relay.enabled"
      ParamValue = "true"
    },
    "set2" = {
      ParamName  = "hubble.ui.enabled"
      ParamValue = "true"
    },
    "set3" = {
      ParamName  = "aksbyocni.enabled"
      ParamValue = "true"
    },
    "set4" = {
      ParamName  = "nodeinit.enabled"
      ParamValue = "true"
    },
    "set5" = {
      ParamName  = "kubeProxyReplacement"
      ParamValue = "true"
    },
    "set6" = {
      ParamName  = "k8sServiceHost"
      ParamValue = "aksciliumspire-nk9rq6f0.hcp.eastus.azmk8s.io"
    },
    "set7" = {
      ParamName  = "k8sServicePort"
      ParamValue = "443"
    },
    "set8" = {
      ParamName = "cluster.id"
      ParamValue = "1"
    },
    "set9" = {
      ParamName = "cluster.name"
      ParamValue = "cluster1"
    },
    "set10" = {
      ParamName = "azure.resourceGroup"
      ParamValue = "rsg-aksciliumspiffe"
    },
    "set11" = {
      ParamName = "ipam.operator.clusterPoolIPv4PodCIDRList"
      ParamValue = "{100.64.0.0/16}"
    },
    "set13" = {
      ParamName = "prometheus.enabled"
      ParamValue = "true"
    },
    "set14" = {
      ParamName = "operator.prometheus.enabled"
      ParamValue = "true"
    },
    "set15" = {
      ParamName = "hubble.metrics.enableOpenMetrics"
      ParamValue = "false"
    },/*
    "set16" = {
      ParamName = "hubble.metrics"
      ParamValue = "{\"dashboards\":{\"annotations\":{},\"enabled\":false,\"label\":\"grafana_dashboard\",\"labelValue\":\"1\",\"namespace\":null},\"enableOpenMetrics\":false,\"enabled\":null,\"port\":9965,\"serviceAnnotations\":{},\"serviceMonitor\":{\"annotations\":{},\"enabled\":false,\"interval\":\"10s\",\"jobLabel\":\"\",\"labels\":{},\"metricRelabelings\":null,\"relabelings\":[{\"replacement\":\"${1}\",\"sourceLabels\":[\"__meta_kubernetes_pod_node_name\"],\"targetLabel\":\"node\"}],\"tlsConfig\":{}},\"tls\":{\"enabled\":false,\"server\":{\"cert\":\"\",\"extraDnsNames\":[],\"extraIpAddresses\":[],\"key\":\"\",\"mtls\":{\"enabled\":false,\"key\":\"ca.crt\",\"name\":null,\"useSecret\":false}}}}"
    },*/
    "set17" = {
      ParamName = "authentication.mutual.spire.enabled"
      ParamValue = "true"
    },
    "set18" = {
      ParamName = "authentication.mutual.spire.install.enabled"
      ParamValue = "true"
    }      

  }

}