terraform {
  required_version = "1.4.5"
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.11"
    }
  }
  backend "s3" {
    bucket = "mot-tfstate"
    key    = "proxmox/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_token
  pm_tls_insecure     = true
}

