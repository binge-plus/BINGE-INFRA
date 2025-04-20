# Service Account Module

This module creates a Google Cloud Platform service account with appropriate IAM roles and key management.

## Features

- Clear separation between standard operational roles and admin roles
- Automatic key rotation mechanism (90-day rotation)
- Security-focused design with principle of least privilege

## Usage

```hcl
module "service_account" {
  source                       = "./modules/service-account"
  project_id                   = var.project_id
  service_account_id           = "binge-plus-sa"
  service_account_display_name = "Binge Plus Service Account"
  
  # Optional: Override the default roles
  service_account_roles = [
    "roles/artifactregistry.admin",
    "roles/bigquery.dataViewer",
    "roles/compute.storageAdmin"
  ]
  
  # Enable admin roles only when needed
  enable_admin_roles = false
}
```

## Security Best Practices

1. **Principle of Least Privilege**: Only assign roles that are absolutely necessary
2. **Separate Admin Roles**: Admin roles are disabled by default and must be explicitly enabled
3. **Key Rotation**: Service account keys are automatically rotated every 90 days
4. **Secrets Management**: Consider using a secrets management solution (Google Secret Manager, HashiCorp Vault) for production

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | The GCP project ID | `string` | n/a | yes |
| service_account_id | The service account ID | `string` | n/a | yes |
| service_account_display_name | The display name for the service account | `string` | n/a | yes |
| service_account_roles | IAM roles to assign to the service account | `list(string)` | Various standard roles | no |
| admin_roles | Admin-level IAM roles | `list(string)` | Admin roles | no |
| enable_admin_roles | Whether to enable admin roles | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| service_account_email | The email address of the service account |
| service_account_id | The ID of the service account |
| service_account_unique_id | The unique ID of the service account |
| service_account_name | The fully-qualified name of the service account |
| service_account_key | The service account key (sensitive) |
| key_rotation_time | Next key rotation time | 