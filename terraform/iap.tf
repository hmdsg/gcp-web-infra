# brandはpjで1つであり再作成できないためterraformで管理するのをやめ、手動で作成する
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_brand
# https://cloud.google.com/iap/docs/programmatic-oauth-clients?hl=ja

resource "google_project_service" "project_service" {
  project = var.project_id
  service = "iap.googleapis.com"
}


resource "google_iap_client" "backend_client" {
  display_name = "backend-client"
  brand        = var.iap_brand_name
}