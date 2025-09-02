# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "task3router" {
  name    = "task3router"
  region  = "us-central1"
  network = google_compute_network.task3vpc.id
}