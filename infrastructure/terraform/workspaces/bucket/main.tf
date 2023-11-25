resource "google_storage_bucket" "terraform_state" {
  name     = "terraform-state-file-demo"
  location = "us-central1"
  project  = "buoyant-arena-405622"

  versioning {
    enabled = true
  }
}
