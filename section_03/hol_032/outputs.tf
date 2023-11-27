output "user_password" {
  value     = aws_iam_user_login_profile.lindsay.password
  sensitive = true
}
