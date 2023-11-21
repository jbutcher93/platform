provider "kubectl" {
  load_config_file = true
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
