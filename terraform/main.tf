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