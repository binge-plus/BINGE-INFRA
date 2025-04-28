output "instance_name" {
  description = "The name of the created compute instance"
  value       = google_compute_instance.instance.name
}

output "instance_external_ip" {
  description = "The external IP address of the compute instance"
  value       = google_compute_instance.instance.network_interface[0].access_config[0].nat_ip
}