resource "google_compute_global_address" "front-lb-address" {
  name = "front-global-lb-ip"
}

resource "google_dns_managed_zone" "app" {
  name        = "app-zone"
  dns_name    = var.domain
  description = "App DNS zone"
}

resource "google_dns_record_set" "backend_a" {
  name         = var.backend_domain
  managed_zone = google_dns_managed_zone.app.name
  type         = "A"
  ttl          = 300

  rrdatas = [google_compute_global_address.front-lb-address.address]
}

