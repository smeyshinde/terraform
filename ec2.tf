provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}

#block    clod provider   uniqe block name
resource "aws_instance" "webserver_block" {
  ami             = var.this_webserveami
  instance_type   = var.this_instacnectype
  key_name        = var.this_kryvalue
  vpc_security_group_ids = [var.this_sg,aws_security_group.ws_sgblock.id ]
  tags = {
    name = "webserver"
  }
  user_data = <<-EOF
      #!/bin/bash
      sudo yum install  nginx -y
      sudo systemctl start nginx
      EOF
    count = var.this_count
  }
resource "aws_security_group" "ws_sgblock" {
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "webserver-sg"
  }
}