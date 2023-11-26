resource "aws_iam_user" "joanne" {
  name = "joanne"
}

resource "aws_iam_group" "billingadmins" {
  name = "BillingAdmins"
}

resource "aws_iam_group_membership" "this" {
  group = aws_iam_group.billingadmins.name
  users = [aws_iam_user.joanne.name]
  name  = "${aws_iam_user.joanne.name}-${aws_iam_group.billingadmins.name}-membership"
}

resource "aws_iam_group_policy_attachment" "this" {
  group      = aws_iam_group.billingadmins.name
  policy_arn = data.aws_iam_policy.billing.arn
}

resource "aws_iam_user_login_profile" "joanne" {
  user            = aws_iam_user.joanne.name
  password_length = 16
}
