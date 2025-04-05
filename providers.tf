terraform {
  backend "gcs" {
    bucket = "binge-plus-tfstate"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}