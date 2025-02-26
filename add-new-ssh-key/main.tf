resource "digitalocean_ssh_key" "new-ssh-key" {
    name = "New SSH key"
    public_key = file("~/.ssh/id_ed25519.pub")
}

data "digitalocean_droplet" "existing" {
    id = var.droplet_id
}

resource "digitalocean_droplet" "rebuild-droplet" {
    image       = data.digitalocean_droplet.existing.image
    name        = data.digitalocean_droplet.existing.name
    region      = data.digitalocean_droplet.existing.region
    size        = data.digitalocean_droplet.existing.size
    vpc_uuid    = data.digitalocean_droplet.existing.vpc_uuid
    ssh_keys    = concat(data.digitalocean_droplet.existing.ssh_keys, [digitalocean_ssh_key.new-ssh-key.id])
    user_data   = data.digitalocean_droplet.existing.user_data
}
