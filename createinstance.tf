terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.51.1"
    }
  }
}
  
resource "aws_vpc" "testvpc" {
    cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "testsubnet" {
    vpc_id = aws_vpc.testvpc.id
    cidr_block = "10.0.1.0/26"
}
resource "aws_security_group" "testsgforterraform" {
    name = "sgtest"
    description = "this is a sg for ssh"
    vpc_id = aws_vpc.testvpc.id
}
resource "aws_security_group_rule" "inboundrule" {
    description = "rule for ssh inbound"
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.testsgforterraform.id
  
}
resource "aws_instance" "terraformserver" {
    ami = "ami-03238ca76a3266a07"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.testsubnet.id
    vpc_security_group_ids = [ aws_security_group.testsgforterraform.id ]

}