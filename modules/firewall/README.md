# Firewall Module

This module manages firewall rules for Google Cloud Platform, providing a more structured and secure approach to managing network access.

## Features

- Separation of common ports (HTTP, HTTPS, SSH) from application-specific ports
- Security-focused configuration with restricted access for sensitive services
- Support for default deny-all rule (commented out by default to avoid disruption)
- Flexible configuration through variables

## Usage

```hcl
module "firewall" {
  source     = "./modules/firewall"
  project_id = var.project_id
  network    = "default"
  
  # Optional: Override default ports
  common_ports = {
    ssh = {
      description = "Allow SSH from specific IPs only"
      ports       = ["22"]
      protocol    = "tcp"
    }
    # Add more as needed
  }
  
  # Optional: Restrict sensitive services
  restricted_source_ranges = ["192.168.1.0/24", "10.0.0.0/8"]
}
```

## Security Best Practices

1. Restrict SSH access to specific IP ranges (corporate VPN, bastion hosts)
2. Limit access to admin interfaces and databases
3. Consider implementing a default deny-all rule after all needed rules are in place
4. Regularly audit firewall rules and remove unused ones

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | The GCP project ID | `string` | n/a | yes |
| network | The VPC network to create the firewall rules in | `string` | n/a | yes |
| common_ports | Common ports to open for the application | `map(object)` | HTTP, HTTPS, SSH | no |
| application_ports | Application-specific ports to open | `map(object)` | Various app ports | no |
| restricted_source_ranges | IPs that should have restricted access | `list(string)` | `["0.0.0.0/0"]` | no |

## Outputs

| Name | Description |
|------|-------------|
| common_firewall_rule_ids | IDs of common firewall rules |
| app_firewall_rule_ids | IDs of application firewall rules |
| all_firewall_rule_names | Names of all created firewall rules | 