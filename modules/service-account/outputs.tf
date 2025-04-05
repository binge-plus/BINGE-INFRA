# Output the email of the created service account
output "service_account_email" {
  description = "The email of the created service account"
  value       = google_service_account.service_account.email
}

# Output the service account ID
output "service_account_id" {
  description = "The ID of the created service account"
  value       = google_service_account.service_account.id
}

# Output the service account name
output "service_account_name" {
  description = "The name of the created service account"
  value       = google_service_account.service_account.name
}