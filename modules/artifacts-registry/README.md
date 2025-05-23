# Artifact Registry Module

This module creates and manages a Google Artifact Registry repository with proper access controls.

## Features

- Supports various repository formats (Docker, NPM, Maven, Python, etc.)
- IAM access control
- Labeling support for better resource organization

## Usage

```hcl
module "artifact_registry" {
  source      = "./modules/artifacts-registry"
  project_id  = var.project_id
  location    = var.region
  name        = "binge-plus-registry"
  description = "Artifact registry for Binge+ application"
  format      = "DOCKER"
  
  labels = {
    environment = "production"
    application = "binge-plus"
  }
}
```

## Security Considerations

By default, this module sets up read access for all users to the repository. In a production environment, you should restrict this to specific service accounts, groups, or users.

To restrict access, modify the IAM member in `main.tf`:

```hcl
member = "serviceAccount:your-service-account@your-project.iam.gserviceaccount.com"
```

## Manual Cleanup Strategy

Although automatic cleanup is not supported in this version, consider implementing a manual cleanup strategy:

1. Set up a scheduled Cloud Function to clean up old images
2. Use the Google Cloud SDK in a cron job to remove old artifacts
3. Document and follow a regular cleanup procedure as part of maintenance

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | The GCP project ID | `string` | n/a | yes |
| location | The location for the artifact registry | `string` | n/a | yes |
| name | The name of the artifact registry repository | `string` | n/a | yes |
| description | A description for the repository | `string` | `""` | no |
| format | The format of the repository | `string` | `"DOCKER"` | no |
| labels | Labels to apply to the repository | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| repository_id | The repository ID |
| repository_name | The name of the repository |
| repository_location | The location of the repository |
| repository_create_time | The time the repository was created |
| repository_format | The format of the repository |
| repository_uri | The URI of the repository | 