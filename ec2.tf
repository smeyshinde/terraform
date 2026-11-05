provider "aws" {              
   region     = ap-south-1
   access_key =  ""
   secret_key =  ""
}

#block    clod provider   uniqe block name 
resource "aws_instance" "webserver_block" {
    ami = "ami-0f19324397f53458f"
    instance_type = "t3.micro"
    key_name = "sample"
    security_groups = "sg-066b3750660930b00"
    tags = {
        name = webserver
    }
   
}