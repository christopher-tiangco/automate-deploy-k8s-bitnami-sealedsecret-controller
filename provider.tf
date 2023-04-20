terraform {
  required_providers {
    argocd = {
      source  = "oboukili/argocd"
      version = "5.1.0"
    }
    curl = {
      source  = "marcofranssen/curl"
      version = "0.2.2"
    }
  }
}

provider "argocd" {
  server_addr = var.argo_cd.host_and_port
  auth_token  = local.argocd_token
}

provider "curl" {
  alias = "with_bearer_token"
  token = module.session.token
}