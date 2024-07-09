variable "region" {
  type        = string
  description = "AWS region information"
}

variable "ingress_ports" {
  type        = list(number)
  description = "List of Ingress Ports for Security Group"
  nullable    = false
}

variable "egress_ports" {
  type        = list(number)
  description = "List of Egress Ports for Security Group"
  nullable    = false
}