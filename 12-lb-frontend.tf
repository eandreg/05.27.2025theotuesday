
# Create url map
resource "google_compute_region_url_map" "frontend-lb" {
  name                  = "frontend-lb"
  region                = "us-central1"
  default_service       = google_compute_region_backend_service.backend-lb.self_link
}

# Create http proxy
resource "google_compute_region_target_http_proxy" "lb-http-proxy" {
  name                  = "lb-http-proxy"
  region                = "us-central1"
  url_map               = google_compute_region_url_map.frontend-lb.self_link
}


# Create forwarding lb "Frontend"
resource "google_compute_forwarding_rule" "lb-forwarding-rule" {
  name                  = "lb-forwarding-rule"
  region                = "us-central1"
  target                = google_compute_region_target_http_proxy.lb-http-proxy.id
  port_range            = "80"
  ip_protocol           = "TCP"
  load_balancing_scheme = "INTERNAL_MANAGED" # Current Gen LB (not classic)
  network               = google_compute_network.task3vpc.id
  subnetwork            = google_compute_subnetwork.task3subnetwork.id


  # During the destroy process, we need to ensure LB is deleted first, before proxy-only subnet
  depends_on = [
    google_compute_subnetwork.task3subnetwork,
    google_compute_subnetwork.regional_proxy_subnet,
    google_compute_region_backend_service.backend-lb
  ]
  
}