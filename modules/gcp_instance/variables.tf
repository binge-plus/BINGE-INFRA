variable "instance_name" {
  description = "Name of the instance"
}

variable "machine_type" {
  description = "Machine type for the instance"
}

variable "zone" {
  description = "The zone to deploy the instance"
}

variable "image" {
  description = "The image to use for the instance"
}

variable "disk_size" {
  description = "Size of the boot disk in GB"
}

variable "ssh_username" {
  description = "Username for SSH access"
  type        = string
}

variable "ssh_public_key" {
  description = "Public SSH key for the user"
  type        = string
}

variable "network" {
  description = "The VPC network to attach the instance to"
  type        = string
}