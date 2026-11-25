provider "aws" {
  region     = "ap-south-1"
  profile    = "configs"
}

#block    clod provider   uniqe block name
resource "aws_instance" "webserver_block" {
  ami             = var.this_webserveami
  instance_type   = var.this_instacnectype
  key_name        = var.this_kryvalue
  vpc_security_group_ids = [var.this_sg]
  tags = {
    name = "webserver"
  }
  user_data = <<-EOF
      #!/bin/bash
      sudo yum install  nginx -y
      sudo systemctl start nginx
      EOF
  }