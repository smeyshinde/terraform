resource "aws_instance" "webserver_block" {
  ami             = var.this_webserveami
  instance_type   = var.this_instacnectype
  key_name        = var.this_kryvalue
  vpc_security_group_ids = [data.aws_security_group.sgdata.id]
  tags = {
    name = "webserver"
  }
  subnet_id = var.ws_subnet
  user_data = <<-EOF
      #!/bin/bash
      sudo yum install  nginx -y
      sudo systemctl start nginx
      EOF
    #count = var.this_count
  }