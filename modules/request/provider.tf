terraform {
  required_providers {
    curl = {
      source = "marcofranssen/curl"
      version = "0.2.2"
    }
  }
}

provider "curl" {
  token = var.token
}