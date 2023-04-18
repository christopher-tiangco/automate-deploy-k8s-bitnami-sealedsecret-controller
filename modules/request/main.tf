data "curl_request" "request" {
    uri = "${var.argo_cd.host}${var.argo_cd.path}"
    http_method = var.http_method
    data = var.data
    lifecycle {
      postcondition {
        condition = self.response_status_code == 200
        error_message = "invalid request"
      }
    }
}

output "response" {
    value = jsondecode(data.curl_request.request.response_body)
}