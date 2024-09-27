variable "project_id" {
  description = "The GCP project ID"
}

variable "network" {
  description = "The network to apply the firewall rules"
  default     = "default"
}