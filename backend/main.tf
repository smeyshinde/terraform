provider "aws" {
  region     = "ap-south-1"
  profile    = "configs"
}
##Partitionkey = LockID
terraform {
  backend "s3" {
    bucket = "cbz-b48new"
    key = "terraform.tfstate"
    dynamodb_table = "cbzb48new"
    region = "ap-south-1"
    profile = "configs"
    shared_credentials_files = ["/home/ameyshinde/.aws/credentials"]
  }
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