variable "name" {
  type = "string"
  description = "The name of the server in the DigitalOcean dashboard"
  default = "consul-server"
}

variable "image" {
  type = "string"
  description = "The base image to use"
  default = "ubuntu-18-04-x64" 
}

variable "region" {
  type = "string"
  description = "The region this  server will be deployed to"
  default = "nyc3"
}

variable "size" {
  type = "string"
  description = "The size of the image"
  default = "s-1vcpu-1gb"
}

variable "ssh-key-name" {
  description = "The name of the SSH key to upload to DO"
  type = "string"
}

variable "public-key" {
  type = "string"
  description = "the SSH public key to upload to DO, e.g. file(\"/Users/hashi/.ssh/id_rsa.pub\")"
}
