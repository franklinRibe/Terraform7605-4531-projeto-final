resource "google_compute_region_instance_group_manager" "app-group" {
  name                      = var.instance_group_name
  base_instance_name        = var.base_instance_name
  region                    = var.region
  distribution_policy_zones = var.policy_zones

  version {
    instance_template = google_compute_instance_template.app-template.self_link
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.autohealing.id
    initial_delay_sec = var.auto_healing_delay_sec
  }
}

resource "google_compute_health_check" "autohealing" {
  name                = var.backend_health_check_name
  check_interval_sec  = var.check_interval_sec
  timeout_sec         = var.timeout_sec
  healthy_threshold   = var.healthy_threshold
  unhealthy_threshold = var.unhealthy_threshold

  http_health_check {
    request_path = var.http_health_path
    port         = var.http_health_port
  }
}