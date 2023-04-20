variable "argo_cd" {
  type = object({
    host     = string
    path = string
  })
}

variable "http_method" {
  type = string  
}

variable "data" {
  type = string
  default = ""
}