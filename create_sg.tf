# This is for creating security group with two ingress rule with port 22 and 80 and one outbound rule

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.56.1"
    }
  }
}

resource "aws_security_group" "sg_shubham" {
  name        = "ssh_http_sg"
  description = "allows ssh and http"
  vpc_id      = "vpc-064b3d62a56abe355"
  
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
     
  }
}