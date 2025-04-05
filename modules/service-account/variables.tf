variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
  default     = "binge-plus-deployment"
}

variable "service_account_id" {
  description = "The ID of the service account to create"
  type        = string
  default     = "binge-plus-sa"
}

variable "service_account_display_name" {
  description = "The display name of the service account"
  type        = string
  default     = "Binge Plus Service Account"
}