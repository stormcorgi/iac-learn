variable "vpc_name" {
  type    = string
  default = "mastodon"
}

variable "vpc_cidr_block" {
  type    = string
  default = "172.31.0.0/16"
}

variable "key_name" {
  type    = string
  default = ""
}
