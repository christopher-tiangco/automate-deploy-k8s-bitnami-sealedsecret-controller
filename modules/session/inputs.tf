variable "argo_cd" {
  description = "ArgoCD admin account"
  type = object({
    host     = string
    username = string
    password = string
  })
}