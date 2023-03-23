resource "aws_vpc" "main" {
  assign_generated_ipv6_cidr_block     = false
  cidr_block                           = var.vpc_cidr_block
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  tags = {
    "Name" = var.vpc_name
  }
  tags_all = {
    "Name" = var.vpc_name
  }
}

resource "aws_flow_log" "main" {
  vpc_id          = aws_vpc.main.id
  iam_role_arn    = var.flow_log_iam_role_arn
  log_destination = var.flow_log_log_destination
  traffic_type    = "ALL"
}
