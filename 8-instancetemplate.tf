
# Template for the linux server
resource "google_compute_instance_template" "linux-template" {
  name                   = "linux-template"
  machine_type           = "e2-medium"
  region                 = "us-central1"

  tags = [ "andre" ]

  disk {
    source_image         = "debian-cloud/debian-12"
    auto_delete          = true
    disk_size_gb         = 100
    boot                 = true
  }

  network_interface {
    subnetwork           = google_compute_subnetwork.task3subnetwork.id
    network              = google_compute_network.task3vpc.id

    
    /*
    access_config {
      // Ephemeral public IP
    }
    */
    
  }

   metadata_startup_script = file("./startup.sh")

}

