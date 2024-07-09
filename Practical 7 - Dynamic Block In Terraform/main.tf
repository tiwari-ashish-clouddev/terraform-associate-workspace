locals {
  sg_tags = {
    Name = "SG-VIA_TERRAFORM"
    Env  = terraform.workspace
  }
}

resource "aws_security_group" "sg-via-terraform" {
  name = "new-custom-sg"

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "TCP"
    }
  }

  dynamic "egress" {
    for_each = var.egress_ports
    content {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "TCP"
    }
  }

  tags = local.sg_tags
}

