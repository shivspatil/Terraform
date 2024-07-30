# This is for creating ec2 instances in multiple availability zones

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.56.1"
    }
  }
}

resource "aws_instance" "staging" {
    ami = "ami-0195204d5dce06d99"
    instance_type = "t3.micro"
    for_each = toset(["us-east-1a","us-east-1b","us-east-1c"])
    availability_zone = each.key
  
}