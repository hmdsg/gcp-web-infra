resource "google_monitoring_notification_channel" "email-me" {
  display_name = "Email Me"
  type = "email"
  labels = {
    email_address = var.alert_email_address
  }
}

# https://github.com/hashicorp/terraform-provider-google/issues/9893
resource "google_monitoring_alert_policy" "alert_policy" {
  display_name = "404 Alert Policy"
  combiner     = "OR"
  conditions {
    display_name = "404 condition"
    condition_matched_log {
      filter = "logName=\"projects/gcp-web-infra/logs/run.googleapis.com%2Frequests\" AND httpRequest.status=404"
    }
  }
  notification_channels = [ google_monitoring_notification_channel.email-me.name ]
  alert_strategy {
    notification_rate_limit {
      period = "300s"
    }
  }
}

