variable "region" {
  type = string
  description = "AWS region information"
}

variable "bucketName" {
  type = string
  description = "S3 Bucket Name."
}

variable "ami" {
  type = string
  description = "Amazon Image information"
}

variable "instanceType" {
  type = string
  description = "EC2 Instance Type"
}