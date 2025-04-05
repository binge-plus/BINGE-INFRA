module "binge-server" {
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
  name        = var.AR_name
  description = var.AR_description
  format      = "DOCKER"
  labels = {
    "environment" = "binge-dev"
  }
}