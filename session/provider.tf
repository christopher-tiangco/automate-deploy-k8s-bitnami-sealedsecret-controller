terraform {
  required_providers {
    restapi = {
      source  = "Mastercard/restapi"
      version = "1.18.0"
    }
  }
}

provider "restapi" {
  uri = var.argo_cd.host
  write_returns_object = true
  headers = {
    Content-Type = "application/json"
  }
  create_method = "POST"
}