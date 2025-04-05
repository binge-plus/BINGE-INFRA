terraform {
  backend "gcs" {
    bucket = "binge-plus-tfstate"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "gcp_instance" {
  source         = "./modules/gcp_instance"
  instance_name  = var.instance_name
  machine_type   = var.machine_type
  zone           = var.zone
  image          = var.image
  disk_size      = var.disk_size
  ssh_username   = var.ssh_username
  ssh_public_key = var.ssh_public_key
}

module "firewall" {
  source     = "./modules/firewall"
  project_id = var.project_id
  network    = "default"
}

module "artifact_registry" {
  source      = "./modules/artifacts-registry"
  project_id  = var.project_id
  location    = var.region
  name        = "binge-plus-registry"
  description = "Binge+ Artifact Registry"
  format      = "DOCKER"
  labels = {
    "environment" = "binge-dev"
  }
}