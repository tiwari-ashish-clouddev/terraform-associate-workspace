

module "module-ec2" {
  source = "./modules/ec2"
  ami = var.ami
  instanceName = var.instanceName
  instanceType = var.instanceType
  region = var.region
}

# Accessing the module outputs
output "instance_id" {
  value = module.module-ec2.instanceId
}

output "instance_name" {
  value = module.module-ec2.instanceName
}

output "availability_zone" {
  value = module.module-ec2.az
}