locals {
  argocd_installation_yaml = file("${path.module}/argocd/argocd-installation.yaml")
  argocd_brand_chart_yaml  = "${path.module}/argocd/brand-chart-application.yaml"
}

resource "kubectl_manifest" "argocd_installation" {
  override_namespace = "argocd"
  for_each           = data.kubectl_file_documents.argocd_installation_yaml.manifests
  yaml_body          = each.value
}

resource "kubectl_manifest" "brand_chart_application_manifest" {
  yaml_body = file("argocd/brand-chart-application.yaml")
}

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

  metadata_startup_script = "echo hi > /test.txt"
}
