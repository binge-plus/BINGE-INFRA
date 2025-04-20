# Common ports firewall rules (HTTP, HTTPS, SSH)
resource "google_compute_firewall" "common_rules" {
  for_each = var.common_ports

  name        = "allow-${each.key}"
  description = each.value.description
  network     = var.network
  project     = var.project_id

  allow {
    protocol = each.value.protocol
    ports    = each.value.ports
  }

  # SSH should be restricted to specific IPs
  source_ranges = each.key == "ssh" ? var.restricted_source_ranges : ["0.0.0.0/0"]
}

# Application-specific firewall rules
resource "google_compute_firewall" "app_rules" {
  for_each = var.application_ports

  name        = "allow-${each.key}"
  description = each.value.description
  network     = var.network
  project     = var.project_id

  allow {
    protocol = each.value.protocol
    ports    = each.value.ports
  }

  # Admin, MongoDB, and other sensitive services should be restricted
  source_ranges = contains(["admin", "mongodb"], each.key) ? var.restricted_source_ranges : ["0.0.0.0/0"]
}

# Default deny all ingress (recommended for security but commented out to avoid disruption)
# Uncomment this after configuring all necessary rules
# resource "google_compute_firewall" "deny_all_ingress" {
#   name        = "deny-all-ingress"
#   description = "Default deny for all ingress traffic"
#   network     = var.network
#   project     = var.project_id
#   priority    = 65535  # Lowest priority, applied last
#
#   deny {
#     protocol = "all"
#   }
#
#   direction     = "INGRESS"
#   source_ranges = ["0.0.0.0/0"]
# }
