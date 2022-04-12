# django_settings用secret
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

# django admin画面のパスワード用secret
resource "google_secret_manager_secret" "superuser-password" {
  secret_id = "superuser_password"

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