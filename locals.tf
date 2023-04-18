locals {
  sealedsecrets_controller_name = "bitnami-sealedsecrets-controller"
  argocd_token                  = module.session.token
}