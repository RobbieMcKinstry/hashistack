output "droplet-status" {
  value = "${module.base.status}"
}

output "price-monthly" {
  value = "${module.base.price-monthly}"
}

output "ip-addr" {
  value = "${module.base.ip-addr}"
}

output "droplet-name" {
  value = "${module.base.droplet-name}"
}

output "droplet-region" {
  value = "${module.base.droplet-region}"
}

output "droplet-size" {
  value = "${module.base.droplet-size}"
}

output "firewall-status" {
  value = "${module.base.status}"
}

output "firewall-pending-changes" {
  value = "${module.base.firewall-pending-changes}"
}

output "firewall-droplets-assigned" {
  value = "${module.base.firewall-droplets-assigned}"
}
