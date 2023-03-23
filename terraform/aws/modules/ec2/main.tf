resource "aws_instance" "db" {
  ami                                  = "ami-05674058913b70816"
  associate_public_ip_address          = true
  availability_zone                    = "ap-northeast-1c"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = false
  get_password_data                    = false
  hibernation                          = false
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  ipv6_addresses                       = []
  key_name                             = var.key_name
  monitoring                           = false
  placement_partition_number           = 0
  secondary_private_ips                = []
  source_dest_check                    = true
  user_data_replace_on_change          = false
  tags = {
    "Name"        = var.machine_name
    "Environment" = var.vpc_name
  }
  tags_all = {
    "Name"        = var.machine_name
    "Environment" = var.vpc_name
  }
  tenancy = "default"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  credit_specification {
    cpu_credits = "standard"
  }

  enclave_options {
    enabled = false
  }

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }

  root_block_device {
    delete_on_termination = false
    encrypted             = true
    tags = {
      "Name" = "${var.vpc_name}-main"
    }
    throughput  = 0
    volume_size = 60
    volume_type = "gp2"
  }
}
