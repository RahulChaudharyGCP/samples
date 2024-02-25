resource "google_storage_bucket" "sample" {
  name     = "${var.gcp_project_id}-sample-bucket"
  location = "US"
  project  = var.gcp_project_id

}