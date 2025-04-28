# Variables 
variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "binge-plus-deployment-1"
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
  default     = "binge-plus"
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

# Artifact Registry

variable "AR_name" {
  description = "The name of the artifact registry repository"
  type        = string
  default     = "binge-plus-registry"
}

variable "AR_description" {
  description = "The description of the artifact registry repository"
  type        = string
  default     = "Binge+ Artifact Registry"
}