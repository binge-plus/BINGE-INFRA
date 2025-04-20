resource "google_artifact_registry_repository" "repository" {
  project       = var.project_id
  location      = var.location
  repository_id = var.name
  description   = var.description
  format        = var.format
  labels        = var.labels

  dynamic "cleanup_policy" {
    for_each = var.cleanup_policies
    content {
      id     = cleanup_policy.value.id
      action = cleanup_policy.value.action
      condition {
        tag_state             = lookup(cleanup_policy.value.condition, "tag_state", null)
        tag_prefixes          = lookup(cleanup_policy.value.condition, "tag_prefixes", null)
        older_than            = lookup(cleanup_policy.value.condition, "older_than", null)
        package_name_prefixes = lookup(cleanup_policy.value.condition, "package_name_prefixes", null)
      }
    }
  }
}

# IAM policy to allow reading from the repository
resource "google_artifact_registry_repository_iam_member" "repository_reader" {
  project    = var.project_id
  location   = var.location
  repository = google_artifact_registry_repository.repository.name
  role       = "roles/artifactregistry.reader"
  member     = "allUsers"  # Consider restricting this to specific users/groups/service accounts
}