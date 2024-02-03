terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {
  description = "DigitalOcean API token"
  
}


variable "ssh_fingerprint" {
  description = "SSH fingerprint"
}


provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "web" {
  image  = "ubuntu-22-04-x64"
  name   = "hs-droplet"
  region = "sgp1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [
    var.ssh_fingerprint
  ]
}

output "droplet_ip" {
  value = digitalocean_droplet.web.ipv4_address
}
output "price-day" {
  value = digitalocean_droplet.web.price_hourly
  
}
output "price" {
  value = digitalocean_droplet.web.price_monthly
  
}

