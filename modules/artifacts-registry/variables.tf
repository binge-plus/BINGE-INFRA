variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "location" {
  description = "The location for the artifact registry"
  type        = string
}

variable "name" {
  description = "The name of the artifact registry repository"
  type        = string
}

variable "description" {
  description = "A description for the repository"
  type        = string
  default     = ""
}

variable "format" {
  description = "The format of the repository (DOCKER, NPM, PYTHON, etc.)"
  type        = string
  default     = "DOCKER"

  validation {
    condition     = contains(["DOCKER", "NPM", "MAVEN", "PYTHON", "APT", "YUM"], var.format)
    error_message = "Format must be one of: DOCKER, NPM, MAVEN, PYTHON, APT, YUM."
  }
}

variable "labels" {
  description = "Labels to apply to the repository"
  type        = map(string)
  default     = {}
}

variable "cleanup_policies" {
  description = "Cleanup policies for the repository"
  type = list(object({
    id      = string
    action  = string
    condition = object({
      tag_state             = optional(string)
      tag_prefixes          = optional(list(string))
      older_than            = optional(string)
      package_name_prefixes = optional(list(string))
    })
  }))
  default = []
}
