resource "aws_subnet" "main-0" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "ap-northeast-1c"
  cidr_block                                     = "172.31.0.0/20"
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    "Name" = "${var.vpc_name}-0"
  }
  tags_all = {
    "Name" = "${var.vpc_name}-0"
  }
  vpc_id = aws_vpc.main.id
}

resource "aws_subnet" "main-16" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "ap-northeast-1a"
  cidr_block                                     = "172.31.16.0/20"
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    "Name" = "${var.vpc_name}-16"
  }
  tags_all = {
    "Name" = "${var.vpc_name}-16"
  }
  vpc_id = aws_vpc.main.id
}

resource "aws_subnet" "main-32" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "ap-northeast-1d"
  cidr_block                                     = "172.31.32.0/20"
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    "Name" = "${var.vpc_name}-32"
  }
  tags_all = {
    "Name" = "${var.vpc_name}-32"
  }
  vpc_id = aws_vpc.main.id
}
