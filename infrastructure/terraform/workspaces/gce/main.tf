resource "google_compute_instance" "default" {
  name         = "my-instance"
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

  metadata_startup_script = <<-EOF
        #!/bin/bash
        echo "Hello, World" > index.html
        sudo apt install busybox -y
        nohup busybox httpd -f -p 8080 &
    EOF
}

resource "google_compute_firewall" "allow_to_gce" {
  name    = "allow-to-gce"
  network = "default"
  project = "buoyant-arena-405622"

  allow {
    protocol = "all"
  }

  target_tags = ["foo", "bar"]

  source_ranges = ["0.0.0.0/0"]
}
