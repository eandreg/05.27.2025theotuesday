# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_health_check
#create health check


resource "google_compute_region_health_check" "task3-healthcheck" {
  region              = "us-central1"
  name                = "task3-healthcheck"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 10 # 50 seconds

  http_health_check {
    request_path      = "/healthz"
    port              = "80"
  }
}
