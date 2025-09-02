# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance


# creating virtual machine for windows server

# resource "google_compute_instance" "windows-rdp" {
#   name                  = var.windows_name
#   machine_type          = var.machine_type_win
#   zone                  = "${var.region}-a"

#   boot_disk {
#     initialize_params {
#       image             = var.windows_image
#     }
#   }

#   network_interface {
#     subnetwork          = google_compute_subnetwork.task3subnetwork.name

#     access_config {
#       // Ephemeral public IP
#     }
#   }
#   tags = [ "jump-box" ]

# }