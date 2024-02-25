resource "google_storage_bucket" "sample" {
  name          = "sample-bucket"
  location      = "US"
  project = var.gcp_project_id

}