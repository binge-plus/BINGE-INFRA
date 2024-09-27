resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = var.network
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow_https" {
  name    = "allow-https"
  network = var.network
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow SSH for all instances
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = var.network
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow access to Movies page on port 1111 for all instances
resource "google_compute_firewall" "allow_1111" {
  name    = "allow-1111"
  network = var.network
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["1111"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow access to Series page on port 4444 for all instances
resource "google_compute_firewall" "allow_4444" {
  name    = "allow-4444"
  network = var.network
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["4444"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow access to Admin panel on port 8501 for all instances
resource "google_compute_firewall" "allow_8501" {
  name    = "allow-8501"
  network = var.network
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["8501"]
  }

  source_ranges = ["0.0.0.0/0"]
}
