resource "google_container_cluster" "name" {
    name = "i27-cluster"
    location = "us-central1-a"
    initial_node_count = var.node_count
    node_config {
      machine_type = "e2-medium"
      disk_type = "30"
    }
}



