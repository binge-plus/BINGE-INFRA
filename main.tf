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

# Variables
variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "steady-service-429006-t5"
}

variable "region" {
  description = "The region to deploy the instance"
  default     = "us-central1"
}

variable "zone" {
  description = "The zone to deploy the instance"
  default     = "us-central1-a"
}

variable "instance_name" {
  description = "Name of the instance"
  default     = "instance-test"
}

variable "machine_type" {
  description = "Machine type for the instance"
  default     = "e2-medium"
}

variable "image" {
  description = "The image to use for the instance"
  default     = "ubuntu-os-cloud/ubuntu-2204-lts"
}

variable "disk_size" {
  description = "Size of the boot disk in GB"
  default     = 30
}

variable "ssh_username" {
  description = "Username for SSH access"
  type        = string
  default     = "binge+"
}

variable "ssh_public_key" {
  description = "Public SSH key for the user"
  type        = string
  # You can add your Desired
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbmKHGqzplfeRywv01nUHiOXUzJehNTHwvO3OS6SUTU9rQPN3QHSBLWX4tcOqGe5VXfUFMZ89flajPvI4EUmde/cv75Le8jreymWx9ZV4KjEt7KZjKqyjjC7lI7ko2cGtIpSSmoAwob0p5RhXQ2szUJTGfW6qeOsNK9BKREbaEFGoZnD/8O1vEibU0choOLskkMknBJxWzFbOa3Cd5/QR7drg66wTzmfa5mQgPtSnlrVaqI83zz8JydTTuf0jiruUB3XIqRnB0bM5q25WHTNQd2SdulEB6wSu6UDVWtPwSPMyw/BNXpd5ggHX0Aq12asSt5cRtRgcf8aOxrt5VtiHb binge+"
}

# Outputs
output "instance_name" {
  value = module.gcp_instance.instance_name
}

output "instance_external_ip" {
  value = module.gcp_instance.instance_external_ip
}