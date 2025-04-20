output "repository_id" {
  description = "The repository ID"
  value       = google_artifact_registry_repository.repository.repository_id
}

output "repository_name" {
  description = "The name of the repository"
  value       = google_artifact_registry_repository.repository.name
}

output "repository_location" {
  description = "The location of the repository"
  value       = google_artifact_registry_repository.repository.location
}

output "repository_create_time" {
  description = "The time the repository was created"
  value       = google_artifact_registry_repository.repository.create_time
}

output "repository_format" {
  description = "The format of the repository"
  value       = google_artifact_registry_repository.repository.format
}

output "repository_uri" {
  description = "The URI of the repository"
  value       = "${google_artifact_registry_repository.repository.location}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.repository.repository_id}"
}