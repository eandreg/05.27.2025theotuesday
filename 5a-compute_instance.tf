
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance


# creating virtual machine for windows server

resource "google_compute_instance" "windows-rdp" {
  name                  = "windows-rdp"
  machine_type          = "e2-medium"
  zone                  = "us-central1-a"

  boot_disk {
    initialize_params {
      image             = "windows-cloud/windows-server-2022-dc-v20240612"
    }
  }

  network_interface {
    subnetwork          = google_compute_subnetwork.task3subnetwork.name

    access_config {
      // Ephemeral public IP
    }
  }
  tags = [ "jump-box" ]

}
