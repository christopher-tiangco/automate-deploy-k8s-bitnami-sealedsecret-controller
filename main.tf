module "session" {
  source = "./session"
  argo_cd = var.argo_cd
}

resource "argocd_application" "bitnami_sealedsecrets_controller" {
  metadata {
    name      = local.sealedsecrets_controller_name
  }

  cascade = true
  wait    = true

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