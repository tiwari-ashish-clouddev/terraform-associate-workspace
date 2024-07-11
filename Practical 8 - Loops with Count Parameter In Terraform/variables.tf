variable "region" {
  type        = string
  description = "AWS region information"
}

variable "tyd_users" {
  type        = list(string)
  description = "A list TYD users"
}