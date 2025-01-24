# Azure Settings
sp_creds   = "~/.azure/sp-accustomerdemo-v6.json"
azr_region = "westeurope"
creator_tag = "patricu"

# VNet Settings
aks_vnet_cidr       = "10.20.0.0/22"
aks_vnet_dns_ip     = "10.20.3.254"   # must be w/in vnet
aks_nodepool_cidr   = "10.20.0.0/23"  # must be w/in vnet
aks_anf_cidr        = "10.20.2.0/24"  # must be w/in vnet
aks_services_cidr   = "172.16.0.0/16" # must not be w/in vnet
aks_services_dns_ip = "172.16.0.10"   # must be w/in services
aks_pods_cidr       = "172.18.0.0/16" # must not be w/in vnet

# AKS Cluster Settings
aks_kubernetes_version       = "1.30.7"
aks_trident_version          = "24.10.0"
aks_trident_protect_version  = "100.2410.1"
azure_storage_account           = "<STORAGEACCOUNT>"
azure_storage_account_key       = "<STORAGEACCESSKEY>"
azure_storage_account_container = "<CONTAINER>"

# Node Pool Settings
aks_node_count = 3
#aks_image_size = "Standard_D2_v5"
aks_image_size = "Standard_D4s_v3"

# ANF Settings
anf_service_level = "Standard"
anf_pool_size     = 4

# Authorized Networks
authorized_networks = [
 {
    cidr_block   = "217.70.208.0/20"
    display_name = "EMEA VPN"
  },
  {
    cidr_block   = "91.15.115.0/24"
    display_name = "home_address"
  },
  {
    cidr_block   = "84.185.63.0/24"
    display_name = "home_address2"
  },
{
    cidr_block   = "79.220.181.0/24"
    display_name = "sto"
  },
]
