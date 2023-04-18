variable "argo_cd" {
  type = object({
    host     = string
    path = string
  })
}

variable "token" {
  type = string
}

variable "http_method" {
  type = string  
}

variable "data" {
  type = string
  default = ""
}