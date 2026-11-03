provider "aws" {
    region     =      #
    access_key =      #    arguments
    secret_key =      #
}
#block    clod provider   uniqe block name 
resource "aws_instance"  "webserver_block" {
    ami            =
    instance_type  =
    key_name       =
    tages ={
        name = webserver
    }
    security_groups =
}