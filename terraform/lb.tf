resource "google_compute_region_network_endpoint_group" "cloudrun_neg" {
  name                  = "cloudrun-neg"
  network_endpoint_type = "SERVERLESS"
  region                = "asia-northeast1"
  cloud_run {
    service = var.backend_cloud_run
  }
}

# https://registry.terraform.io/modules/GoogleCloudPlatform/lb-http/google/latest/submodules/serverless_negs
module "lb-http" {
  source            = "GoogleCloudPlatform/lb-http/google//modules/serverless_negs"
  version           = "~> 4.5"

  project = var.project_id
  name    = "backend-lb"

  address                         = google_compute_global_address.front-lb-address.address
  create_address	                = false
  ssl                             = true
  managed_ssl_certificate_domains = [var.backend_domain]
  https_redirect                  = false
  http_forward                    = false
  backends = {
    default = {
      description            = null
      enable_cdn             = false
      custom_request_headers = null

      log_config = {
        enable      = true
        sample_rate = 1.0
      }

      groups = [
        {
          group = google_compute_region_network_endpoint_group.cloudrun_neg.id
        }
      ]

      iap_config = {
        enable               = false
        oauth2_client_id     = null
        oauth2_client_secret = null
      }
      security_policy = null
    }
  }
}