resource "google_compute_router_nat" "task3nat" {
  name                               = "task3nat"
  router                             = google_compute_router.task3router.name
  region                             = "us-central1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                             = google_compute_subnetwork.task3subnetwork.id
    source_ip_ranges_to_nat          = ["ALL_IP_RANGES"]
  }

  nat_ips                            = [google_compute_address.task3nat.self_link]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address
resource "google_compute_address" "task3nat" {
  name                               = "task3nat"
  address_type                       = "EXTERNAL"
  network_tier                       = "PREMIUM"
  region                             = "us-central1"
}