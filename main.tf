module "base" {
  source       = "./modules/base"
  ssh-key-name = "hashi-macbook"
  public-key   = "${file("/Users/robbie/.ssh/id_rsa.pub")}"
}

module "consul" {
  source       = "./modules/consul"
  bind-ip      = "${module.base.ip-addr}"
  private-key  = "${file("/Users/robbie/.ssh/temporary.rsa")}"
}

module "vault" {
  source       = "./modules/vault"
  bind-ip      = "${module.consul.ip-addr}"
  private-key  = "${file("/Users/robbie/.ssh/temporary.rsa")}"
}
