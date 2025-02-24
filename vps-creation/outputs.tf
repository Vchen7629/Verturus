output "grafana_ipv4" {
    value = digitalocean_droplet.grafana.ipv4_address
}

output "grafana_ipv6" {
    value = digitalocean_droplet.grafana.ipv6_address
}