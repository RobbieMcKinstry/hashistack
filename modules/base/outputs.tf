output "status" {
  value = "${digitalocean_droplet.consul-server.status}"
}

output "price-monthly" {
  value = "${digitalocean_droplet.consul-server.price_monthly}"
}

output "ip-addr" {
  value = "${digitalocean_droplet.consul-server.ipv4_address}"
}

output "droplet-name" {
  value = "${digitalocean_droplet.consul-server.name}"
}

output "droplet-region" {
  value = "${digitalocean_droplet.consul-server.region}"
}

output "droplet-size" {
  value = "${digitalocean_droplet.consul-server.size}"
}

output "firewall-status" {
  value = "${digitalocean_firewall.consul-server.status}"
}

output "firewall-pending-changes" {
  value = "${digitalocean_firewall.consul-server.pending_changes}"
}

output "firewall-droplets-assigned" {
  value = "${digitalocean_firewall.consul-server.droplet_ids}"
}
