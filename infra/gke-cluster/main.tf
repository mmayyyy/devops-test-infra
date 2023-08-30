module "gke" {
  source                  = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  project_id              = var.project_id
  name                    = var.cluster_name
  region                  = var.region
  zones                   = var.zones
  network                 = var.network
  subnetwork              = var.subnetwork
  ip_range_pods           = var.ip_range_pods
  ip_range_services       = var.ip_range_services
  enable_private_endpoint = var.enable_private_endpoint
  enable_private_nodes    = var.enable_private_nodes
  master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  node_pools              = var.node_pools
}
