variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "network" {
  description = "The VPC network to create the firewall rules in"
  type        = string
}

variable "common_ports" {
  description = "Common ports to open for the application"
  type        = map(object({
    description = string
    ports       = list(string)
    protocol    = string
  }))
  default = {
    http = {
      description = "Allow HTTP traffic"
      ports       = ["80"]
      protocol    = "tcp"
    }
    https = {
      description = "Allow HTTPS traffic"
      ports       = ["443"]
      protocol    = "tcp"
    }
    ssh = {
      description = "Allow SSH traffic"
      ports       = ["22"]
      protocol    = "tcp"
    }
  }
}

variable "application_ports" {
  description = "Application-specific ports to open"
  type        = map(object({
    description = string
    ports       = list(string)
    protocol    = string
  }))
  default = {
    binge-be = {
      description = "Allow access to BE"
      ports       = ["7777"]
      protocol    = "tcp"
    }
    binge-fe = {
      description = "Allow access to FE"
      ports       = ["4444"]
      protocol    = "tcp"
    }
    binge-admin = {
      description = "Allow access to Admin panel"
      ports       = ["8501"]
      protocol    = "tcp"
    }
    binge-admin-server = {
      description = "Allow access to Workflow dashboard"
      ports       = ["3000", "3001", "3002", "3003", "3004", "3005", "3006", "3007", "3008", "3009"]
      protocol    = "tcp"
    }
    mongodb = {
      description = "Allow MongoDB connection"
      ports       = ["27017"]
      protocol    = "tcp"
    }
    opsbee = {
      description = "Allow access to Opsbee"
      ports       = ["6000"]
      protocol    = "tcp"
    }
  }
}

variable "restricted_source_ranges" {
  description = "IPs that should have restricted access (for admin, SSH, etc.)"
  type        = list(string)
  default     = ["0.0.0.0/0"]  # Should be replaced with actual restricted IPs
} 
