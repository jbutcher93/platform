terraform {
  backend "gcs" {
    bucket = "terraform-state-file-demo"
    prefix = "terraform/bucket"
  }
}

provider "google" {
  project = "buoyant-arena-405622"
  region  = "us-central1"
  zone    = "us-central1-a"
}

provider "google-beta" {
  project = "buoyant-arena-405622"
  region  = "us-central1"
  zone    = "us-central1-a"
}
