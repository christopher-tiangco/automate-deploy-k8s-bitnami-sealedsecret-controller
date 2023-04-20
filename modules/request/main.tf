data "curl_request" "request" {
    uri = "${var.argo_cd.host}${var.argo_cd.path}"
    http_method = var.http_method
    data = var.data
}

output "response" {
    value = jsondecode(data.curl_request.request.response_body)
}