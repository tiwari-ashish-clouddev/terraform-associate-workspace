terraform {
  required_providers {
    aws={
      source = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

resource "aws_instance" "module-ec2" {
  ami           = var.ami
  instance_type = var.instanceType
  tags = {
    Name = var.instanceName
  }
}