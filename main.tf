module "service_account" {
  source                       = "./modules/service-account" 
  project_id                   = var.project_id
  service_account_id           = "binge-plus-backup-sa"
  service_account_display_name = "Binge Plus Backup Service Account"
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

# module "binge-plus-admin-server" {
#   source         = "./modules/gcp_instance"
#   instance_name  = "binge-plus-admin"
#   machine_type   = var.machine_type 
#   zone           = var.zone
#   image          = var.image
#   disk_size      = var.disk_size
#   ssh_username   = var.ssh_username
#   ssh_public_key = var.ssh_public_key
# }

module "b2b-master" {
  source         = "./modules/gcp_instance"
  instance_name  = "b2b-master"
  machine_type   = var.machine_type 
  zone           = "us-central1-b"
  image          = var.image
  disk_size      = var.disk_size
  ssh_username   = var.ssh_username
  ssh_public_key = var.ssh_public_key
}

module "b2b-slave" {
  source         = "./modules/gcp_instance"
  instance_name  = "b2b-slave"
  machine_type   = var.machine_type 
  zone           = "us-central1-c"
  image          = var.image
  disk_size      = var.disk_size
  ssh_username   = var.ssh_username
  ssh_public_key = var.ssh_public_key
}

module "b2b-slave-1" {
  source         = "./modules/gcp_instance"
  instance_name  = "b2b-slave-1" 
  machine_type   = var.machine_type 
  zone           = "us-central1-c"
  image          = var.image
  disk_size      = var.disk_size
  ssh_username   = var.ssh_username
  ssh_public_key = var.ssh_public_key
}

module "b2b-master-deb" {
  source         = "./modules/gcp_instance"
  instance_name  = "b2b-master"
  machine_type   = var.machine_type 
  zone           = "us-central1-b"
  image          = var.image
  disk_size      = var.disk_size
  ssh_username   = var.ssh_username
  ssh_public_key = var.ssh_public_key
}

module "b2b-slave-deb" {
  source         = "./modules/gcp_instance"
  instance_name  = "b2b-slave"
  machine_type   = var.machine_type 
  zone           = "us-central1-c"
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