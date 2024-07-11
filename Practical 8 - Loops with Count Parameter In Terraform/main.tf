resource "aws_iam_user" "tyd-dev-users" {
  count = length(var.tyd_users)
  name  = var.tyd_users[count.index]
}