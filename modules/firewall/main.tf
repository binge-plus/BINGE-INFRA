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

# Allow access to the workflow dashboard on port 3000 
resource "google_compute_firewall" "allow_3000" {
  name    = "allow-3000"
  network = var.network
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["3000"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow access to the workflow dashboard on port 3001 
resource "google_compute_firewall" "allow_3001" {
  name    = "allow-3001"
  network = var.network
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["3001"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow access to the workflow dashboard on port 3001 
resource "google_compute_firewall" "allow_1112" {
  name    = "allow-1112"
  network = var.network
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["1112"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow access to the opsbee ard on port 6000
resource "google_compute_firewall" "allow_6000"{
  name    = "allow-6000"
  network = var.network
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["6000"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# MONGODB Connection
resource "google_compute_firewall" "allow_mongodb" {
  name    = "allow-mongodb"
  network = var.network
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  source_ranges = ["0.0.0.0/0"]
}
