provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my-first-ec2-via-tf" {
  ami = "ami-013e83f579886baeb"
  instance_type = "t2.micro"
  tags = {
    Name = "tyd-ec2-instance"
  }
}