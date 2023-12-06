output "public_ip" {
  value       = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
  description = "The external IP address of the compute engine instance"
}

output "subnets" {
  value       = data.google_compute_network.network.subnetworks_self_links
  description = "Subnets in default VPC"
}
