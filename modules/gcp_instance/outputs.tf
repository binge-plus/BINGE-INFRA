output "instance_name" {
  value = google_compute_instance.instance.name
}

output "instance_external_ip" {
  value = google_compute_instance.instance.network_interface[0].access_config[0].nat_ip
}