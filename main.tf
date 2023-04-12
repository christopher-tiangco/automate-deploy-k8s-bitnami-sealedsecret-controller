resource "restapi_object" "api_session_token" {
  path = local.argo_cd.session_token_path
  data = jsonencode({
    "username": var.argo_cd.username
    "password": var.argo_cd.password
  })

  # The following attribute fixes the terraform apply error "internal validation failed; object ID is not set, but *may* have been created; this should never happen"
  # - This is because the API endpoint does NOT include an "id" attribute in the API response
  # - Reference: https://github.com/Mastercard/terraform-provider-restapi/issues/4#issuecomment-421487611
  id_attribute = "token"
}

data "restapi_object" "query_applications" {
    path = "/api/v1/applications"
    #jsondecode(restapi_object.api_session_token.api_response).token
}