# Create the service account
resource "google_service_account" "service_account" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
  project      = var.project_id
}

# Assign the necessary IAM roles to the service account
resource "google_project_iam_member" "service_account_bindings" {
  for_each = toset([
    "roles/artifactregistry.admin",
    "roles/bigquery.dataViewer",
    "roles/run.viewer",
    "roles/cloudsql.viewer",
    "roles/compute.storageAdmin",
    "roles/compute.viewer",
    "roles/pubsub.viewer",
    "roles/storage.objectAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/resourcemanager.projectIamAdmin"
  ])
  
  project = var.project_id
  role    = each.key
  member  = "serviceAccount:${google_service_account.service_account.email}"
}
