output "this_vpcId" {
  value = aws_vpc.webserver_vpc.id
}

output "this_subId" {
  value = aws_subnet.subnet_1.id
}