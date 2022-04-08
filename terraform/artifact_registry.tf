resource "google_artifact_registry_repository" "my-repo" {
  provider = google-beta

  location = "asia-northeast1"
  repository_id = "backend-repository"
  description = "backend docker repository"
  format = "DOCKER"
}