# GCP Settings
sa_creds           = "~/.gcloud/netapp-astra-demo-99eea9252449.json"
gcp_sa             = "trident-demo-terraform@netapp-astra-demo.iam.gserviceaccount.com"
gcp_project        = "netapp-astra-demo"
gcp_project_number = "335504790148"
gcp_region         = "europe-west4"
gcp_zones          = ["europe-west4-b", "europe-west4-c"]
creator_label      = "patricu"

# VPC Settings
gke_subnetwork_cidr   = "10.10.0.0/23"
gke_ip_range_control  = "172.16.0.0/28"
gke_ip_range_services = "172.17.0.0/16"
gke_ip_range_pods     = "172.18.0.0/16"

# GKE Cluster Settings
gke_kubernetes_version = "1.32.3-gke.1927009"
gke_trident_version    = "25.02.1"
gke_private_cluster    = true

# Node Pool Settings
gke_machine_type       = "e2-medium"
gke_image_type         = "COS_CONTAINERD"
gke_initial_node_count = 1 # per-zone
gke_min_node_count     = 1 # per-zone
gke_max_node_count     = 3 # per-zone

# GCNV Settings
gcnv_service_level = "standard"
gcnv_pool_capacity = "4096"

# Authorized Networks
authorized_networks = [
  {
    cidr_block   = "198.51.100.0/24"
    display_name = "company_range"
  },
  {
    cidr_block   = "84.185.54.152/32"
    display_name = "home_address"
  },
  {
    cidr_block   = "217.70.208.0/20"
    display_name = "emea_vpn"
  },
]
