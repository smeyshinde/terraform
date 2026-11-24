resource "aws_vpc" "webserver_vpc" {
      cidr_block = var.vpc_cird
}

resource "aws_subnet" "subnet_1" {
    vpc_id = aws_vpc.webserver_vpc.id
    cidr_block = var.subnet_cird
}
