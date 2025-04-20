resource "google_artifact_registry_repository" "repository" {
  project       = var.project_id
  location      = var.location
  repository_id = var.name
  description   = var.description
  format        = var.format
  labels        = var.labels
}

# IAM policy to allow reading from the repository
resource "google_artifact_registry_repository_iam_member" "repository_reader" {
  project    = var.project_id
  location   = var.location
  repository = google_artifact_registry_repository.repository.name
  role       = "roles/artifactregistry.reader"
  member     = "allUsers"  # Consider restricting this to specific users/groups/service accounts
}