

resource "google_compute_region_health_check" "lb-health-check" {
  name                = "lb-health-check"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3

  http_health_check {
    request_path = "/index.html"
    port         = 80
  }
}



resource "google_compute_region_backend_service" "backend-lb" {
  name                  = "backend-lb"
  region                = "us-central1"
  health_checks         = [google_compute_region_health_check.lb-health-check.self_link]
  protocol              = "HTTP"
  load_balancing_scheme = "INTERNAL_MANAGED"
  port_name             = "webserver"
  backend {
  group           = google_compute_region_instance_group_manager.app.instance_group
  capacity_scaler = 1.0
  balancing_mode  = "UTILIZATION"
  }
}