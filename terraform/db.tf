resource "google_sql_database_instance" "main-mysql" {
  name                = "main-mysql-db"
  database_version    = "MYSQL_5_7"
  region              = "asia-northeast1"
  deletion_protection = true

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "mysql-database" {
  name     = "my-database"
  instance = google_sql_database_instance.main-mysql.name
}

resource "google_sql_user" "mysql-users" {
  name     = "me"
  instance = google_sql_database_instance.main-mysql.name
  password = var.dbpassword
}
