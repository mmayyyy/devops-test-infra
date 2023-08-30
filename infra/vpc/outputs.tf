output "vpc_name" {
  value       = module.vpc.network_name
  description = "The name of the created VPC"
}

output "subnet_names" {
  value       = module.vpc.subnets_names
  description = "The names of the created subnets"
}

