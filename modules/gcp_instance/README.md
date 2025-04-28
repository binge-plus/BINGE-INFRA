# GCP Instance Module

This module creates a Google Compute Engine instance on Google Cloud Platform with SSH access and customizable parameters.

## Features

- Customizable machine type, disk size, and image
- SSH key injection for secure access
- Flexible network attachment
- Startup script for initial configuration

## Usage

```hcl
module "gcp_instance" {
  source         = "./modules/gcp_instance"
  instance_name  = "example-instance"
  machine_type   = "e2-medium"
  zone           = "us-central1-a"
  image          = "debian-cloud/debian-11"
  disk_size      = 20
  ssh_username   = "your-username"
  ssh_public_key = file("~/.ssh/id_rsa.pub")
  network        = "default"
}
```

## Inputs

| Name           | Description                              | Type   | Default | Required |
|----------------|------------------------------------------|--------|---------|:--------:|
| instance_name  | Name of the instance                     | string | n/a     | yes      |
| machine_type   | Machine type for the instance            | string | n/a     | yes      |
| zone           | The zone to deploy the instance          | string | n/a     | yes      |
| image          | The image to use for the instance        | string | n/a     | yes      |
| disk_size      | Size of the boot disk in GB              | number | n/a     | yes      |
| ssh_username   | Username for SSH access                  | string | n/a     | yes      |
| ssh_public_key | Public SSH key for the user              | string | n/a     | yes      |
| network        | The VPC network to attach the instance   | string | n/a     | yes      |

## Outputs

| Name                | Description                                 |
|---------------------|---------------------------------------------|
| instance_name       | The name of the created compute instance    |
| instance_external_ip| The external IP address of the instance     |

## Security Best Practices

1. Use strong, unique SSH keys for each user
2. Restrict network access to the instance using firewall rules
3. Regularly update and patch the instance using the startup script or automation tools
4. Avoid using the default network in production; create custom VPCs for better isolation 