module "module-ec2" {
  source       = "./modules/ec2"
  ami          = var.ami
  instanceName = var.instanceName
  instanceType = var.instanceType
}

resource "aws_eip" "eip" {
  instance = module.module-ec2.instanceId
  domain = "vpc"
}