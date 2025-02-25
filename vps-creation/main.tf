resource "digitalocean_droplet" "grafana" {
    image    = "ubuntu-24-04-x64"
    name     = "grafana-server"
    region   = "SFO3"
    size     = "s-1vcpu-1gb"
    ssh_keys = [var.ssh_keygen_fingerprint]
    ipv6     = true
}

resource "digitalocean_firewall" "existing" {
    name = "firewall"

    inbound_rule {
        protocol         = "tcp"
        port_range       = "22"
        source_addresses = ["0.0.0.0/0", "::/0"]
    }

    inbound_rule {
        protocol         = "tcp"
        port_range       = "80"
        source_addresses = ["0.0.0.0/0", "::/0"]
    }

    inbound_rule {
        protocol         = "tcp"
        port_range       = "443"
        source_addresses = ["0.0.0.0/0", "::/0"]
    }

    inbound_rule {
        protocol         = "tcp"
        port_range       = "2096"
        source_addresses = ["0.0.0.0/0", "::/0"]
    }

    inbound_rule {
        protocol         = "tcp"
        port_range       = "8440"
        source_addresses = ["0.0.0.0/0", "::/0"]
    }

    inbound_rule {
        protocol         = "tcp"
        port_range       = "8443"
        source_addresses = ["0.0.0.0/0", "::/0"]
    }

    outbound_rule {
        protocol              = "tcp"
        port_range            = "53"
        destination_addresses = ["0.0.0.0/0", "::/0"]
    }

    outbound_rule {
        protocol              = "tcp"
        port_range            = "80"
        destination_addresses = ["0.0.0.0/0", "::/0"]
    }

    outbound_rule {
        protocol              = "tcp"
        port_range            = "443"
        destination_addresses = ["0.0.0.0/0", "::/0"]
    }

    outbound_rule {
        protocol              = "udp"
        port_range            = "53"
        destination_addresses = ["0.0.0.0/0", "::/0"]
    }

    outbound_rule {
        protocol              = "icmp"
        destination_addresses = ["0.0.0.0/0", "::/0"]
    }

    droplet_ids = [digitalocean_droplet.grafana.id]
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
        digitalocean_droplet.grafana.urn,
        digitalocean_domain.grafana.urn
    ]
}
