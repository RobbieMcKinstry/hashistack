resource "template_dir" "custom_templates" {
  source_dir      = "${path.module}/${var.templates}"
  destination_dir = "${path.module}/${var.file-artifacts}"
  vars {
    bind-ip       = "${var.bind-ip}"
    data-dir      = "${var.consul-data}"
  }

  connection {
    host          = "${var.bind-ip}"
    private_key   = "${var.private-key}"
  }

  provisioner "file" {
    source        = "${path.module}/${var.file-artifacts}/consul.service"
    destination   = "/etc/systemd/system/consul.service"
  }

  provisioner "file" {
      source      = "${path.module}/${var.file-artifacts}/provision-consul-node.sh"
      destination = "/tmp/provision-consul-node.sh"
  }

  provisioner "remote-exec" {
      inline = [
          "chmod +x /tmp/provision-consul-node.sh",
          "/tmp/provision-consul-node.sh"
      ]
  }
}
