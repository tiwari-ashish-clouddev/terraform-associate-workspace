
data "aws_ami" "mumbai_based_t2micro_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["al2023-ami-2023*-kernel-6.1-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

data "aws_ami" "singapore_based_t2micro_ami" {
  provider    = aws.singapore
  most_recent = true
  filter {
    name   = "name"
    values = ["al2023-ami-2023*-kernel-6.1-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}


resource "aws_instance" "mumbai-based-ec2-instance-from-tf" {
  ami           = data.aws_ami.mumbai_based_t2micro_ami.id
  instance_type = var.instanceType
  tags = {
    Name = "mumbai-based-ec2-instance-from-tf"
  }
}

resource "aws_instance" "singapore-based-ec2-instance-from-tf" {
  ami           = data.aws_ami.singapore_based_t2micro_ami.id
  instance_type = var.instanceType
  provider      = aws.singapore
  tags = {
    Name = "singapore-based-ec2-instance-from-tf"
  }
}