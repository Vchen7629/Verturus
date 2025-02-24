resource "digitalocean_droplet" "grafana" {
    image    = "ubuntu-24-04-x64"
    name     = "grafana-server"
    region   = "SFO3"
    size     = "s-1vcpu-1gb"
    ssh_keys = [var.ssh_keygen_fingerprint]
    ipv6     = true
}

resource "digitalocean_domain" "grafana" {
  name = "verturus.com"

}

resource "digitalocean_record" "grafana_a" {
    domain = digitalocean_domain.grafana.name
    type = "A"
    name = "@"
    value = digitalocean_droplet.grafana.ipv4_address
    ttl = 1800
}

resource "digitalocean_record" "grafana_aaaa" {
    domain = digitalocean_domain.grafana.name
    type = "AAAA"
    name = "@"
    value = digitalocean_droplet.grafana.ipv6_address
    ttl = 1800
}

resource "digitalocean_project_resources" "grafana" {
    project = var.project_id
    resources = [
        digitalocean_droplet.grafana.urn
    ]
}