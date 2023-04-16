#@TODO:
# - Use the curl provider to retrieve ArgoCD token then store to local

data "curl_request" "argocd_token" {
  uri = "${var.argo_cd.host}/api/v1/session"
  http_method = "POST"
  data = jsonencode({
    "username": var.argo_cd.username
    "password": var.argo_cd.password
  })
}

resource "argocd_application" "bitnami_sealedsecrets_controller" {
  metadata {
    name      = local.sealedsecrets_controller_name
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