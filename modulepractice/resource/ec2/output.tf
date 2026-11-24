output "this_instancepubIp" {
  value = aws_instance.webserver_block.public_ip
}
output "this_instanceprivateDns" {
   value = aws_instance.webserver_block.private_dns
}
output "this_instanceIp" {
  value = aws_instance.webserver_block.id
}