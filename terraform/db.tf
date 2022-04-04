resource "google_sql_database_instance" "main" {
  name             = "main-db"
  database_version = "POSTGRES_13"
  region           = "asia-northeast1"

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "database" {
  name     = "my-database"
  instance = google_sql_database_instance.main.name
}

resource "google_sql_user" "users" {
  name     = "me"
  instance = google_sql_database_instance.main.name
  password = "password123"
}
