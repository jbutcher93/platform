locals {
  argocd_installation_yaml = file("${path.module}/argocd/argocd-installation.yaml")
  argocd_brand_chart_yaml  = "${path.module}/argocd/brand-chart-applicationset.yaml"
  app_project_yaml         = file("${path.module}/argocd/app-project.yaml")
}

resource "kubectl_manifest" "argocd_installation" {
  depends_on = [
    kubernetes_namespace.argo_ns
  ]
  override_namespace = "argocd"
  for_each           = data.kubectl_file_documents.argocd_installation_yaml.manifests
  yaml_body          = each.value
}

resource "kubectl_manifest" "argo_app_manifest" {
  depends_on = [
    kubectl_manifest.argocd_installation
  ]
  yaml_body = templatefile(local.argocd_brand_chart_yaml, {
    environment = var.environment
  })
}
