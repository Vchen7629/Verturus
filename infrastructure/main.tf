resource "digitalocean_droplet" "grafana" {
    image  = "ubuntu-24-04-x64"
    name   = "grafana-server"
    region = "SFO3"
    size   = "s-1vcpu-1gb"
    ssh_keys = [var.ssh_keygen_fingerprint]
}