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

variable "bind-ip" {
    type        = "string"
    description = "IP address of the server Vault is going to run on"
}

variable "private-key" {
    type        = "string"
    description = "load your private key from a file, so that you can use it to provision the consul server"
}
