variable "project_id" {
  description = "The ID of the Google Cloud project."
  type        = string
  default     = "service-project-b-343709"
}

variable "cluster_name" {
  description = "The name of the GKE cluster."
  type        = string
  default     = "node-app-cluster01"
}

variable "region" {
  description = "The region where the cluster will be created."
  type        = string
  default     = "asia-southeast1"
}

variable "zones" {
  description = "The zones where the cluster's nodes will be located."
  type        = list(string)
  default     = ["asia-southeast1-a", "asia-southeast1-b"]
}

variable "network" {
  description = "The name of the VPC network."
  type        = string
  default     = "vpc-01"
}

variable "subnetwork" {
  description = "The name of the subnetwork."
  type        = string
  default     = "gke-subnetwork01"
}

variable "ip_range_pods" {
  description = "The IP range for pods in the cluster's subnetwork."
  type        = string
  default     = "gke-subnetwork-pods"
}

variable "ip_range_services" {
  description = "The IP range for services in the cluster's subnetwork."
  type        = string
  default     = "gke-subnetwork-services"
}

variable "enable_private_endpoint" {
  description = "Enable or disable private endpoint."
  type        = bool
  default     = false
}

variable "enable_private_nodes" {
  description = "Enable or disable private nodes."
  type        = bool
  default     = true
}

variable "master_ipv4_cidr_block" {
  description = "The IP range for the master's private IPv4 CIDR block."
  type        = string
  default     = "10.0.0.0/28"
}

variable "node_pools" {
  description = "List of node pool configurations."
  type        = list(map(string))
  default = [{
    name               = "node-app-pool"
    machine_type       = "e2-standard-4"
    node_locations     = "asia-southeast1-a,asia-southeast1-b"
    min_count          = 1
    max_count          = 100
    local_ssd_count    = 0
    spot               = false
    disk_size_gb       = 100
    disk_type          = "pd-standard"
    image_type         = "COS_CONTAINERD"
    enable_gcfs        = false
    enable_gvnic       = false
    auto_repair        = true
    auto_upgrade       = true
    preemptible        = false
    initial_node_count = 1
  }]
}
