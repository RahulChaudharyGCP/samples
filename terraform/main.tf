resource "google_storage_bucket" "sample" {
  name     = "${var.gcp_project_id}-sample-bucket"
  location = "US"
  project  = var.gcp_project_id

}


resource "google_compute_network" "vpc_network" {
  project                                   = var.gcp_project_id
  name                                      = "vpc-network"
  auto_create_subnetworks                   = true
  network_firewall_policy_enforcement_order = "BEFORE_CLASSIC_FIREWALL"
}

resource "google_compute_network" "gcp_network" {
  project                                   = var.gcp_project_id
  name                                      = "gcp-network"
  auto_create_subnetworks                   = true
  network_firewall_policy_enforcement_order = "BEFORE_CLASSIC_FIREWALL"
}

resource "google_compute_network_peering" "vpc_gcp_peering" {
  name         = "vpc_gcp_peering"
  network      = google_compute_network.vpc_network.self_link
  peer_network = google_compute_network.gcp_network.self_link
}

resource "google_compute_network_peering" "gcp_vpc_peering" {
  name         = "gcp_vpc_peering"
  network      = google_compute_network.gcp_network.self_link
  peer_network = google_compute_network.vpc_network.self_link
}