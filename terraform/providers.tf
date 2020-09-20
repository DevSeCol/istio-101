terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "devops-training"

    workspaces {
      name = "test-ricardo"
    }
  }
}

# provider "google" {
#   project = var.project_id
#   region  = var.region
#   zone    = "${var.region}-b"
# }

# Required for Istio addon
provider "google-beta" {
  project = var.project_id
  region  = var.region
  zone    = "${var.region}-b"
}
