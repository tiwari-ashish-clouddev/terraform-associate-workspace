resource "aws_instance" "my-first-ec2-via-tf" {
  ami           = var.ami
  instance_type = var.instanceType
  tags = {
    Name = "tyd-ec2-instance-1"
  }
}