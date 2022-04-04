resource "google_storage_bucket" "static-bucket" {
  name          = "${var.project_id}-media-bucket"
  location      = "ASIA"
  force_destroy = true
}