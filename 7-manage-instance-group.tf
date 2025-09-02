

# Checking for all zones that are up/available. 
data "google_compute_zones" "available"{
  status                  = "UP"
}

# create manage instance group
resource "google_compute_region_instance_group_manager" "app" {
  name                     = "app"
  depends_on         = [google_compute_router_nat.task3nat]
  base_instance_name       = "app"
  region                   = "us-central1"


  distribution_policy_zones = data.google_compute_zones.available.names



  version {
    instance_template      = google_compute_instance_template.linux-template.self_link
  }

  target_size = 3

  

  named_port {
    name = "web"
    port = 80
  }

  auto_healing_policies {
    health_check          = google_compute_region_health_check.task3-healthcheck.id
    initial_delay_sec     = 300
  }
}









##################################################################################################
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones
# Datasource: Get a list of Google Compute zones that are UP in a region
# data "google_compute_zones" "available" {
#   status = "UP"
#   #region = "" (optional if provider default is set)
# }

# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# # Resource: Managed Instance Group
# resource "google_compute_region_instance_group_manager" "app" {
#   depends_on         = [google_compute_router_nat.iowanat]
#   name               = "app-mig"
#   base_instance_name = "app"
#   #region = "" (optional if provider default is set)

#   # Compute zones to be used for VM creation
#   distribution_policy_zones = data.google_compute_zones.available.names

#   # Instance Template
#   version {
#     instance_template = google_compute_region_instance_template.app01.id
#   }

#   # Named Port
#   named_port {
#     name = "webserver"
#     port = 80
#   }

#   # Autohealing Config
#   auto_healing_policies {
#     health_check      = google_compute_region_health_check.app.id
#     initial_delay_sec = 300
#   }
# }