resource "aws_iam_user" "this" {
  name = "neal"
}

resource "aws_iam_group" "admins" {
  name = "admins"
}

resource "aws_iam_group_membership" "this" {
  group = aws_iam_group.admins.name
  users = [aws_iam_user.this.name]
  name  = "${aws_iam_user.this.name}-${aws_iam_group.admins.name}-membership"
}

resource "aws_iam_group_policy_attachment" "this" {
  group      = aws_iam_group.admins.id
  policy_arn = data.aws_iam_policy.administratoraccess.arn
}

resource "aws_iam_user_login_profile" "this" {
  user            = aws_iam_user.this.name
  password_length = 16
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

output "user_password" {
  value     = aws_iam_user_login_profile.this.password
  sensitive = true
}

output "user_keys" {
  value     = aws_iam_access_key.this.secret
  sensitive = true
}

output "user_key_id" {
  value = aws_iam_access_key.this.id
}
