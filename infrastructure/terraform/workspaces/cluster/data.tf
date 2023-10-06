data "kubectl_file_documents" "argocd_installation_yaml" {
  content = local.argocd_installation_yaml
}
