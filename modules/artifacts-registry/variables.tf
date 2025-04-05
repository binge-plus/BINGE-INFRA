variable "project_id" {
  description = "The Google Cloud project ID"
  type        = string
}

variable "location" {
  description = "The location of the artifact registry repository"
  type        = string
}

variable "name" {
  description = "The name of the artifact registry repository"
  type        = string
}

variable "description" {
  description = "The description of the artifact registry repository"
  type        = string
  default     = ""
}

variable "format" {
  description = "The format of the artifact registry repository"
  type        = string
  validation {
    condition     = contains(["DOCKER", "MAVEN", "NPM", "PYTHON", "GO"], var.format)
    error_message = "Format must be one of: DOCKER, MAVEN, NPM, PYTHON, GO"
  }
}

variable "labels" {
  description = "Labels to be applied to the repository"
  type        = map(string)
  default     = {}
}
