data "curl_request" "argocd_token" {
  uri = local.argo_cd_url
  http_method = "POST"
  data = jsonencode({
    "username" =  var.argo_cd.username
    "password" = var.argo_cd.password
  })
}

output "token" {
    value = jsondecode(data.curl_request.argocd_token.response_body).token
}