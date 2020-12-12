resource "google_compute_global_forwarding_rule" "forwarding" {
  name       = var.forwarding
  target     = google_compute_target_http_proxy.target_proxy.id
  port_range = var.backend_ports 
}

resource "google_compute_target_http_proxy" "target_proxy" {
  name    = var.target-proxy
  url_map = google_compute_url_map.urlmap.id
}

resource "google_compute_url_map" "urlmap" {
  name        = var.urlmap-name
  description = "Url map do projeto"
  default_service = google_compute_backend_service.be_service.id
}

resource "google_compute_backend_service" "be_service" {
  name          = var.be_service_name
  port_name     = "http"
  protocol      = "HTTP"
  timeout_sec   = 10
  health_checks = [google_compute_http_health_check.health_check.id]
  backend  {
      group     = google_compute_region_instance_group_manager.app-group.instance_group
  }
}

resource "google_compute_http_health_check" "health_check" {
  name               = var.health_check_name
  request_path       = var.hc_request_path
  check_interval_sec = var.hc_check_interval
  timeout_sec        = var.hc_timeout
}
