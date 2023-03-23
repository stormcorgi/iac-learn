variable "vpc_name" {
  type    = string
  default = "mastodon"
}

variable "vpc_cidr_block" {
  type    = string
  default = "172.31.0.0/16"
}

variable "flow_log_iam_role_arn" {
  type = string
}

variable "flow_log_log_destination" {
  type = string
}
