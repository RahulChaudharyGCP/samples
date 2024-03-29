/*terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=4.67.0"
    }
  }
  
}*/
provider "google" {
  project = var.gcp_project_id
  region  = "us-central1"

}

terraform {
  backend "gcs" {
    bucket = "gke-app-dev"
    prefix = "sample/app"
  }
}