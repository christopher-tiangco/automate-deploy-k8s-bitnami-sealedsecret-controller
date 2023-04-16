locals {
  sealedsecrets_controller_name = "bitnami-sealedsecrets-controller"
  argocd_token = jsondecode(data.curl_request.argocd_token.response_body).token
}