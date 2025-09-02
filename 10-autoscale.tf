# creating the auto scaling for the managed instance groups. 


resource "google_compute_region_autoscaler" "task3-autoscaler" {
  name                  = "task3-autoscaler"
  region                = "us-central1"
  target                = google_compute_region_instance_group_manager.app.id

  autoscaling_policy {
    max_replicas        = 6
    min_replicas        = 3
    cooldown_period     = 60

    cpu_utilization {
      target = 0.5
    }
  }
}