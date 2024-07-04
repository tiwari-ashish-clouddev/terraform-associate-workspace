resource "aws_instance" "module-ec2" {
  ami           = var.ami
  instance_type = var.instanceType
  tags = {
    Name = var.instanceName
  }
}