output "instanceId" {
  value = aws_instance.module-ec2.id
  description = "Return instance Id from aws instance."
}

output "instanceName" {
  value = aws_instance.module-ec2.tags.Name
  description = "Return instance name from aws instance."
}

output "az" {
  value = aws_instance.module-ec2.availability_zone
  description = "Return  Availability Zone of EC2 Instance."
}

output "subnetId" {
  value = aws_instance.module-ec2.subnet_id
  description = "Returns "
}