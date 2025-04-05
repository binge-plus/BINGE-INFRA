output "repository_name" {
  description = "The name of the created artifact registry repository"
  value       = google_artifact_registry_repository.repository.repository_id
}

output "repository_id" {
  description = "The ID of the created artifact registry repository"
  value       = google_artifact_registry_repository.repository.id
}

output "repository_location" {
  description = "The location of the created artifact registry repository"
  value       = google_artifact_registry_repository.repository.location
}