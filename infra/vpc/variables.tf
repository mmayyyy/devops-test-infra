variable "project_id" {
  description = "The ID of the project"
  default     = "service-project-b-343709"
}

variable "network_name" {
  description = "The name of the VPC network"
  default     = "vpc-01"
}

variable "routing_mode" {
  description = "The routing mode for the VPC network"
  default     = "GLOBAL"
}

variable "subnets" {
  description = "List of subnet configurations"
  type        = list(map(any))
  default = [{
    subnet_name           = "gke-subnetwork"
    subnet_ip             = "10.148.0.0/20"
    subnet_region         = "asia-southeast1"
    subnet_private_access = "true"
  }]
}

variable "secondary_ranges" {
  description = "Map of secondary IP ranges"
  type        = map(list(map(string)))
  default = {
    gke-subnetwork01 = [
      {
        range_name    = "gke-subnetwork-pods"
        ip_cidr_range = "10.36.0.0/14"
      },
      {
        range_name    = "gke-subnetwork-services"
        ip_cidr_range = "10.40.0.0/20"
      }
    ]
  }
}

