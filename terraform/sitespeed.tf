provider "digitalocean" {}

data "digitalocean_image" "sitespeed" {
  name = "base-sitespeed-image"
}

resource "digitalocean_volume" "sitespeed" {
  region      = "nyc1"
  name        = "sitespeed-results"
  size        = 50
  description = "Storage for sitespeed.io results"
}

resource "digitalocean_droplet" "sitespeed" {
  image  = "${data.digitalocean_image.sitespeed.image}"
  name   = "sitespeed.io"
  region = "nyc1"
  size   = "512mb"
  ssh_keys = ["${var.ssh_fingerprint}"]
  volume_ids = ["${digitalocean_volume.sitespeed.id}"]
  user_data = "${file("${path.module}/scripts/startup.sh")}"
}

output "Name" {
  value = "${digitalocean_droplet.sitespeed.name}"
}