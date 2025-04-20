variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "service_account_id" {
  description = "The service account ID"
  type        = string
}

variable "service_account_display_name" {
  description = "The display name for the service account"
  type        = string
}

variable "service_account_roles" {
  description = "IAM roles to assign to the service account"
  type        = list(string)
  default = [
    "roles/artifactregistry.admin",
    "roles/bigquery.dataViewer",
    "roles/run.viewer",
    "roles/cloudsql.viewer",
    "roles/compute.storageAdmin",
    "roles/compute.viewer",
    "roles/pubsub.viewer",
    "roles/storage.objectAdmin",
    "roles/iam.serviceAccountKeyAdmin"
  ]
}

variable "admin_roles" {
  description = "Admin-level IAM roles to assign to the service account (use with caution)"
  type        = list(string)
  default = [
    "roles/iam.serviceAccountAdmin",
    "roles/resourcemanager.projectIamAdmin"
  ]
}

variable "enable_admin_roles" {
  description = "Whether to enable admin-level roles (use with caution)"
  type        = bool
  default     = false
}