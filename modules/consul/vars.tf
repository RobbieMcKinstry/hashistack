variable "templates" {
    type        = "string"
    description = "directory of all files needed to be templated by TF"
    default     = "templates"
}
 
variable "file-artifacts" {
    type        = "string"
    description = "file actifacts is the output directory from templating everything"
    default     = "file-artifacts"
}

variable "consul-data" {
    type        = "string"
    description = "name of the directory where consul writes it persister storage"
    default     = "/consul-data"
}

variable "bind-ip" {
    type        = "string"
    description = "The IP address to which the Consul server will bind. Please don't use 0.0.0.0. Inject this IP address when your node is created."
}

variable "private-key" {
    type        = "string"
    description = "load your private key from a file, so that you can use it to provision the consul server"
}
