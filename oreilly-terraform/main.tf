terraform {
  required_version = "> 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.35.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

# input variable
variable "server_port" {
  description = "The port the server will use for HTTP request"
  type        = number
  default     = 8080
}

resource "aws_instance" "example" {
  ami                         = "ami-07c589821f2b353aa"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.instance.id]
  user_data                   = <<-EOF
    #!/bin/bash
    echo "Hello, World!" > index.html
    nohup busybox httpd -f -p ${var.server_port} &
    EOF
  user_data_replace_on_change = true
  tags = {
    Name = "terraform-example"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# output
output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP address of the web server"
}
output "public_port" {
  value       = var.server_port
  description = "The public port of the web server"
}
