terraform {
  required_version = ">= 0.13"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

provider "kubectl" {
  load_config_file = true
}

resource "kubectl_manifest" "argocd_oralb_router_chart_manifest" {
  yaml_body = templatefile("router-chart.appset.yaml", {
    git_url         = "https://github.com/jbutcher93/platform.git"
    environment     = var.environment,
    brand           = "oralb",
    apollo_graph_id = var.oralb_graph,
    apollo_key      = var.oralb_apollo_key,
    router_version  = "v1.35.0",
    loglevel        = "debug",
    auth_require    = "true",
    auth_urls       = var.oralb_auth_urls
    target_revision = "main"
    prune           = "true"
    url             = "oralb-gateway-stage.lightyearapi.com"
    cpu             = "6m"
    memory          = "150M"
    header_disabled = "false"
    rhai_enabled    = "true"
    cors_origins    = var.cors_origins_oralb
  })
}
