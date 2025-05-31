# ### https://developer.hashicorp.com/terraform/language/values/outputs

output "lb_static_ip_address" {
  description = "The static IP address of the load balancer."
  value       = "http://${google_compute_address.lb.address}"
}

# https://developer.hashicorp.com/terraform/language/functions/join
output "compute_zones" {
  description = "Comma-separated compute zones"
  # convert set into string delimited by commas (CSV) before output
  value       = join(", ", data.google_compute_zones.available.names)
}


output "instance_external_ips" {
  value = {
    vm1 = "http://${google_compute_instance.iowahq-vm.network_interface[0].access_config[0].nat_ip}"
    vm2 = "http://${google_compute_instance.tokyo1-vm.network_interface[0].access_config[0].nat_ip}"
    # vm3 = "http://${google_compute_instance.tokyo01-vm.network_interface[0].access_config[0].nat_ip}"
  }
  description = "The external IP address of the GCE instance."
}







# # ALB Frontend Static IP

# output "instance_external_ip" {
#   value       = "http://${google_compute_instance.iowahq-vm.network_interface[0].access_config[0].nat_ip}"
#   description = "The external IP address of the GCE instance."
# }


