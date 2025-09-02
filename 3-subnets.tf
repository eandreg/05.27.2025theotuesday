

resource "google_compute_subnetwork" "task3subnetwork" {
  name                     = "task3subnetwork"
  ip_cidr_range            = "10.100.10.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.task3vpc.id
  private_ip_google_access = true
}


resource "google_compute_subnetwork" "regional_proxy_subnet" {
  name          = "regional-proxy-subnet"
  region        = "us-central1"
  ip_cidr_range = "192.168.255.0/24"
  # This purpose reserves this subnet for regional Envoy-based load balancers
  purpose = "REGIONAL_MANAGED_PROXY"
  network = google_compute_network.task3vpc.id
  role    = "ACTIVE"
}

# resource "google_compute_subnetwork" "sekou" {
#   name                     = "sekou"
#   ip_cidr_range            = "10.100.20.0/24"
#   region                   = "asia-northeast1"
#   network                  = google_compute_network.task3.id
#   private_ip_google_access = true
# }

# resource "google_compute_subnetwork" "carlton" {
#   name                     = "carlton"
#   ip_cidr_range            = "10.100.30.0/24"
#   region                   = "europe-west2"
#   network                  = google_compute_network.task3.id
#   private_ip_google_access = true
# }

# resource "google_compute_subnetwork" "cooper" {
#   name                     = "cooper"
#   ip_cidr_range            = "10.100.40.0/24"
#   region                   = "africa-south1"
#   network                  = google_compute_network.task3.id
#   private_ip_google_access = true
# }

# resource "google_compute_subnetwork" "william" {
#   name                     = "william"
#   ip_cidr_range            = "10.100.50.0/24"
#   region                   = "europe-west1"
#   network                  = google_compute_network.task3.id
#   private_ip_google_access = true
# }

# resource "google_compute_subnetwork" "charles" {
#   name                     = "charles"
#   ip_cidr_range            = "10.100.60.0/24"
#   region                   = "us-west2"
#   network                  = google_compute_network.task3.id
#   private_ip_google_access = true
# }

# resource "google_compute_subnetwork" "dajon" {
#   name                     = "dajon"
#   ip_cidr_range            = "10.100.70.0/24"
#   region                   = "us-west1"
#   network                  = google_compute_network.task3.id
#   private_ip_google_access = true
# }

# resource "google_compute_subnetwork" "logan" {
#   name                     = "logan"
#   ip_cidr_range            = "10.100.80.0/24"
#   region                   = "asia-east1"
#   network                  = google_compute_network.task3.id
#   private_ip_google_access = true
# }
# resource "google_compute_subnetwork" "bailey" {
#   name                     = "bailey"
#   ip_cidr_range            = "10.100.90.0/24"
#   region                   = "southamerica-east1"
#   network                  = google_compute_network.task3.id
#   private_ip_google_access = true
# }

# resource "google_compute_subnetwork" "andre" {
#   name                     = "andre"
#   ip_cidr_range            = "10.100.100.0/24"
#   region                   = "southamerica-west1"
#   network                  = google_compute_network.task3.id
#   private_ip_google_access = true
# }
