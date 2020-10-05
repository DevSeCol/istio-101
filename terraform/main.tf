resource "google_container_cluster" "primary-cluster" {
  provider                 = "google-beta"
  name                     = "cluster-istio"
  location                 = "${var.region}-a"
  remove_default_node_pool = true
  initial_node_count       = 1
  min_master_version       = "1.17.9-gke.1504"
  #network                  = var.cluster_network
  #subnetwork               = var.cluster_subnetwork

  network_policy {
    enabled = true
  }

  addons_config {
    # Enabling Istio addon
    istio_config {
      disabled = false
    }
  }

}

resource "google_container_node_pool" "primary-pool" {
  name       = "primary-pool"
  location   = google_container_cluster.primary-cluster.location
  cluster    = google_container_cluster.primary-cluster.name
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "g1-small"

    #service_account = var.service_account

    labels = {
      machine-type = preemtible
    }

    tags = ["spark-cluster"]

    metadata = {
      disable-legacy-endpoints = "true"
    }
    # permisos
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append"
    ]

  }
}
