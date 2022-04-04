resource "google_secret_manager_secret" "secret-db" {
  secret_id = "django_settings"

  replication {
    user_managed {
      replicas {
        location = "us-central1"
      }
      replicas {
        location = "asia-northeast1"
      }
    }
  }
}