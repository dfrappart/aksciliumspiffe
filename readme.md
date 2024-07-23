# Lab AKS Cilium Auth

This repo contains samples IaC configurations to test Cilium mutual authentication on AKS.
It's organized in 3 layers in the `terraformconfig` folder

- Network layer, containing the vnet configuration
- AKS layer, containing... the AKS cluster and its related resources
- Helm layer, because I'm lazy and keep teraform also to deploy helm chart, most of the time

The `yamlconfig` folder contains yaml manifest, or helm chart deployment code, for those which are not done through terraform.