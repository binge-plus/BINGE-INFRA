module "binge-plus-fe-server" {
  source         = "./modules/gcp_instance"
  instance_name  = "binge-plus-fe"
  machine_type   = var.machine_type
  zone           = var.zone
  image          = var.image
  disk_size      = var.disk_size
  ssh_username   = var.ssh_username
  ssh_public_key = var.ssh_public_key
  network        = "default"
}

module "binge-plus-be-server" {
  source         = "./modules/gcp_instance"
  instance_name  = "binge-plus-be"
  machine_type   = var.machine_type
  zone           = var.zone
  image          = var.image
  disk_size      = var.disk_size
  ssh_username   = var.ssh_username
  ssh_public_key = var.ssh_public_key
  network        = "default"
}

module "binge-plus-admin-server" {
  source         = "./modules/gcp_instance"
  instance_name  = "binge-plus-admin"
  machine_type   = var.machine_type 
  zone           = var.zone
  image          = var.image
  disk_size      = var.disk_size
  ssh_username   = var.ssh_username
  ssh_public_key = var.ssh_public_key
  network        = "default"
}

module "firewall" {
  source     = "./modules/firewall"
  project_id = var.project_id
  network    = "default"
  restricted_source_ranges = ["35.235.240.0/20"]
}

# module "artifact_registry" {
#  source      = "./modules/artifacts-registry"
#  project_id  = var.project_id
#  location    = var.region
#  name        = var.AR_name
#  description = var.AR_description
#  format      = "DOCKER"
#  labels = {
#    "environment" = "binge-plus"
#  }
#} 