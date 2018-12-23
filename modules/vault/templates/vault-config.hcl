ui = true

storage "consul" {
  address = "127.0.0.1:8500"
  path    = "vault/"
}

listener "tcp" {
 address     = "${bind-ip}:8200"
 tls_disable = 1
}
