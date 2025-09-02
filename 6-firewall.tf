resource "google_compute_firewall" "web_traffic" {
  name    = "${google_compute_network.task3vpc.name}-allow-web-traffic"
  network = google_compute_network.task3vpc.name

  
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  target_tags = ["andre"]
  source_tags = ["jump-box"]
}




resource "google_compute_firewall" "allow-rdp" {
  name    = "allow-rdp"
  network = google_compute_network.task3vpc.name

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["jump-box"]
}



# resource "google_compute_firewall" "allow-ping" {
#   name    = "${google_compute_network.task3.name}-allow-ping"
#   network = google_compute_network.task3.name

#   allow {
#     protocol = "icmp"
#   }

#   source_ranges = ["0.0.0.0/0"]
# }
# resource "google_compute_firewall" "rdp" {
#   name    = "rdp"
#   network = google_compute_network.task3.name

#   allow {
#     protocol = "tcp"
#     ports    = ["3389"]
#   }

#   source_ranges = ["0.0.0.0/0"]
#   target_tags = ["alex", "sekou", "carlton", "cooper", "william", "chuck", "dj", "logan", "ad", "andre"]       
#   source_tags = ["windows-machine"]

# }

