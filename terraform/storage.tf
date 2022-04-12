# django-storages用バケット
resource "google_storage_bucket" "media-bucket" {
  name          = "${var.project_id}-media-bucket"
  location      = "ASIA"
  force_destroy = true
}

# 外部公開用バケット
resource "google_storage_bucket" "static-bucket" {
  name          = "${var.project_id}-static-bucket"
  location      = "ASIA"
  force_destroy = true
}

resource "google_storage_bucket_iam_binding" "static-bucket" {
  bucket = google_storage_bucket.static-bucket.name
  role   = "roles/storage.legacyObjectReader"
  members = [
    "allUsers",
  ]
}