provider "google" {
  project     = var.project_id
  region      = "asia-northeast1"
}

provider "google-beta" {
  project     = var.project_id
  region      = "asia-northeast1"
}

terraform {
  required_providers {
    google = "~> 4.16.0"
  }
}