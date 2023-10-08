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
