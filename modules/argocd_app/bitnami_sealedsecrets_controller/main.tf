resource "argocd_application" "bitnami_sealedsecrets_controller" {
  metadata {
    name = "bitnami-sealedsecrets-controller"
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

output "data" {
  value = {
    id = argocd_application.bitnami_sealedsecrets_controller.id
  }
}