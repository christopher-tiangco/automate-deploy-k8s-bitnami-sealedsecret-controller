module "session" {
  source  = "./modules/session"
  argo_cd = var.argo_cd
}

module "argocd_app_sync" {
  source = "./modules/request"
  argo_cd = {
    host = var.argo_cd.host
    path = "/api/v1/applications/${argocd_application.bitnami_sealedsecrets_controller.metadata[0].name}/sync"
  }
  token       = local.argocd_token
  http_method = "POST"
}

resource "argocd_application" "bitnami_sealedsecrets_controller" {
  metadata {
    name = local.sealedsecrets_controller_name
  }

  cascade = true
  wait    = false

  spec {
    destination {
      server    = "https://kubernetes.default.svc"
      namespace = "default"
    }

    source {
      repo_url        = var.bitnami_sealedsecrets_controller.git_source.repo_url
      path            = var.bitnami_sealedsecrets_controller.git_source.repo_path
      target_revision = "master"
    }
  }
}

