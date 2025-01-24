# Creating a VPC
resource "google_compute_network" "Task" {
  name = var.vpc_name # the name of the vpc created in google cloud
  auto_create_subnetworks = false 
}

# Create Multiple Subnets 
resource "google_compute_subnetwork" "Task-subnets" {
  count = length(var.subnets)
  name = var.subnets[count.index].name
  ip_cidr_range = var.subnets[count.index].ip_cidr_range
  region = var.subnets[count.index].subnet_region
  network = google_compute_network.Task-subnets-vpc.self_link
}

# Create Firewalls 
# port numbers: 22, 8080, 9000, 80
# allow/deny,
# protocols
# source_ranges
resource "google_compute_firewall" "Task-subnets-fw" {
  name = "i27-allow-ssh-http-jenkins-ports"
  network = google_compute_network.Task-subnets-vpc.name
  dynamic "allow" {
    for_each = var.ports
    content {
      protocol = "tcp"
      ports = [allow.value]
    }
  }
  source_ranges = var.source_ranges
}
