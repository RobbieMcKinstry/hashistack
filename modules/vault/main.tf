resource "template_dir" "vault-templates" {
  source_dir      = "${path.module}/${var.templates}"
  destination_dir = "${path.module}/${var.file-artifacts}"
  vars {
    bind-ip ="${var.bind-ip}"
  }

  connection {
    host          = "${var.bind-ip}"
    private_key   = "${var.private-key}"
  }

  provisioner "file" {
    source        = "${path.module}/${var.file-artifacts}/vault.service"
    destination   = "/etc/systemd/system/vault.service"
  }

  provisioner "file" {
    source        = "${path.module}/${var.file-artifacts}/vault-config.hcl"
    destination   = "/opt/vault-config.hcl"
  }

  provisioner "file" {
      source      = "${path.module}/${var.file-artifacts}/provision-vault.sh"
      destination = "/tmp/provision-vault.sh"
  }

  provisioner "remote-exec" {
      inline = [
          "chmod +x /tmp/provision-vault.sh",
          "/tmp/provision-vault.sh"
      ]
  }
}
