provider "aws" {
  region     = "ap-south-1"
  profile    = "configs"
}

module "ec2" {
   source = "terraform/modulepractice/resource/ec2"
   this_webserveami = "ami-0f19324397f53458f"
   this_instacnectype = "t3.micro"
   this_kryvalue = "sample"
   this_sg = "sg-066b3750660930b00"
   ws_subnet = module.vpc.this_subId
}




module "vpc" {
    source = "terraform/modulepractice/resource/vpc"
    vpc_cird = "10.0.0.0/16"
    subnet_cird = "10.0.0.0/20"
}