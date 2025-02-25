terraform {
  required_providers {
    digitalocean = {
        source = "digitalocean/digitalocean"
        version = "~> 2.0"
    }
  }
}

terraform { 
  cloud { 
    organization = "Verturus" 

    workspaces { 
      name = "Grafana-monitoring-vps" 
    } 
  } 
}

provider "digitalocean" {
  token = var.do_token
}