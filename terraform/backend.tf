terraform {
  backend "gcs" {
    bucket = "gcp-web-infra-tfstate"
  }
}