# AWS Settings
aws_region               = "us-east-1"
aws_cred_file            = "~/.aws/Trident-protectDemoUser-credential-terraform.json"
availability_zones_count = 2
creator_tag              = "patricu"

# Trident protect Settings
aws_trident_protect_version = "100.2506.0"

# VPC Settings
eks_vpc_cidr             = "10.30.0.0/16"
eks_public_subnet_cidrs  = ["10.30.0.0/24",  "10.30.1.0/24"]  # len must equal availability_zones_count
eks_private_subnet_cidrs = ["10.30.10.0/24", "10.30.11.0/24"] # len must equal availability_zones_count

# EKS Settings
eks_kubernetes_version = "1.29"
eks_node_count         = 2
eks_node_min           = 2
eks_node_max           = 5
eks_node_volume_size   = 50
eks_instance_type      = "t2.medium"
eks_addons             = [
  {
    name    = "kube-proxy"
    version = "v1.29.7-eksbuild.2"
  },
  {
    name    = "netapp_trident-operator"
    version = "v24.2.0-eksbuild.1"
  }
]

# FSxN Settings
fsxn_storage_capacity           = 5120
fsxn_throughput_capacity        = 384
fsxn_disk_iops_mode             = "AUTOMATIC"
fsxn_user_provisioned_disk_iops = null

# Authorized Networks
authorized_networks = [
  {
    cidr_block   = "84.185.54.152/32"
    display_name = "home_address"
  },
  {
    cidr_block   = "217.70.208.0/20"
    display_name = "emea_vpn"
  },
  {
    cidr_block   = "185.35.244.0/22"
    display_name = "us-east_vpn"
  },
{
    cidr_block   = "79.220.181.0/24"
    display_name = "sto"
  },
]

# Outputs
vscrd_release  = "https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/release-5.0"
