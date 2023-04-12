variable "argo_cd" {
  description = "ArgoCD admin account"
  type = object({
    host     = string
    username = string
    password = string
  })
}

variable "bitnami_sealedsecrets_controller" {
  description = "Bitnami Sealedsecrets Controller Git repo and path"
  type = object({
    git_source = object({
      repo_url  = string
      repo_path = string
    })
  })
}