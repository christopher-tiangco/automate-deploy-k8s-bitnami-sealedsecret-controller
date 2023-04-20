module "session" {
  source  = "./modules/session"
  argo_cd = var.argo_cd
}

module "bitnami_sealedsecrets_controller" {
  source                           = "./modules/argocd_app/bitnami_sealedsecrets_controller"
  argo_cd                          = var.argo_cd
  argo_cd_auth_token               = module.session.token
  bitnami_sealedsecrets_controller = var.bitnami_sealedsecrets_controller
}

module "argocd_app_sync" {
  source = "./modules/request"
  providers = {
    curl = curl.with_bearer_token
  }
  argo_cd = {
    host = var.argo_cd.host

    # Using `module.bitnami_sealedsecrets_controller.data.id` makes this module run after the `bitnami_sealedsecrets_controller` module (implied dependency)
    path = "/api/v1/applications/${trimsuffix(module.bitnami_sealedsecrets_controller.data.id, ":")}/sync"
  }
  http_method = "POST"
}



