terraform {
  required_version = ">= 1.0"

  required_providers {
    abrha = {
      source  = "abrhacom/abrha"
      version = "1.3.3"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.9"
    }
  }
}

provider "abrha" {
  token        = var.abrha_api_key
  api_endpoint = var.abrha_endpoint
}
