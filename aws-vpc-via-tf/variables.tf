variable "vpc_availability_zones" {
  type        = list(string)
  description = "Available Zones"
  default     = ["ap-south-1a", "ap-south-1b"]
}