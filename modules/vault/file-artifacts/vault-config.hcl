ui = true

storage "consul" {
  address = "127.0.0.1:8500"
  path    = "vault/"
}

listener "tcp" {
 address     = "209.97.155.9:8200"
 tls_disable = 1
}
