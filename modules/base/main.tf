resource "digitalocean_droplet" "consul-server" {
  image              = "${var.image}"
  name               = "${var.name}"
  region             = "${var.region}"
  size               = "${var.size}"
  ipv6               = true
  private_networking = true
  monitoring         = true
  backups            = true
  tags               = ["consul-server"]
  ssh_keys           = ["${digitalocean_ssh_key.droplet-key.fingerprint}"]
}

resource "digitalocean_ssh_key" "droplet-key" {
  name       = "${var.ssh-key-name}"
  public_key = "${var.public-key}"
}

resource "digitalocean_firewall" "consul-server" {
  name = "consul-server-firewall"
  tags = ["consul-server"]

  droplet_ids = ["${digitalocean_droplet.consul-server.id}"]

  inbound_rule = [
    {
      protocol           = "tcp"
      port_range         = "22"
      source_addresses   = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol           = "tcp"
      port_range         = "8300"
      source_addresses   = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol           = "tcp"
      port_range         = "8301"
      source_addresses   = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol           = "tcp"
      port_range         = "8302"
      source_addresses   = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol           = "tcp"
      port_range         = "8400"
      source_addresses   = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol           = "tcp"
      port_range         = "8500"
      source_addresses   = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol           = "tcp"
      port_range         = "8600"
      source_addresses   = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol           = "icmp"
      source_addresses   = ["0.0.0.0/0", "::/0"]
    },
  ]

  outbound_rule = [
    {
      protocol                = "tcp"
      port_range              = "1-65535"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol                = "udp"
      port_range              = "1-65535"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol                = "icmp"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
    },
  ]
}
