output "user_password" {
  value     = aws_iam_user_login_profile.joanne.password
  sensitive = true
}
