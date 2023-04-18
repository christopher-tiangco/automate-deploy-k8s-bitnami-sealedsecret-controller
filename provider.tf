terraform {
  required_providers {
    argocd = {
      source  = "oboukili/argocd"
      version = "5.1.0"
    }
  }
}

provider "argocd" {
  server_addr = var.argo_cd.host_and_port
  auth_token  = local.argocd_token
}