locals {
  all_ips = ["0.0.0.0/0"]
}

resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = file(var.startup_script_location)
}

resource "google_compute_firewall" "allow_to_gce" {
  name    = var.firewall_rule_name
  network = "default"
  project = "buoyant-arena-405622"

  allow {
    protocol = "all"
  }

  target_tags = ["foo", "bar"]

  source_ranges = local.all_ips
}
