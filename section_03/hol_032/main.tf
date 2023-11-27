resource "aws_iam_user" "lindsay" {
  name                 = "lindsay"
  permissions_boundary = aws_iam_policy.PermissionsBoundary.id
}

resource "aws_iam_policy_attachment" "this" {
  name       = "lindsay-iamfullaccess-attachment"
  policy_arn = data.aws_iam_policy.IAMFullAccess.arn
  users      = [aws_iam_user.lindsay.name]
}

resource "aws_iam_policy" "PermissionsBoundary" {
  name   = var.permissions_boundary_policy_name
  policy = data.aws_iam_policy_document.PermissionsBoundary.json
}

resource "aws_iam_user_login_profile" "lindsay" {
  user            = aws_iam_user.lindsay.name
  password_length = 20
}
