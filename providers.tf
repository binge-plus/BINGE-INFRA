terraform {
  backend "gcs" {
    bucket = "binge-plus-deployment-1-tfstate"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}