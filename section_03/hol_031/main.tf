resource "aws_iam_user" "dave" {
  name = "dave"
  tags = {
    Department = "ec2admins"
  }
}

resource "aws_iam_group" "ec2admins" {
  name = "Ec2Admins"
}

resource "aws_iam_policy" "Ec2AdminManageProduction" {
  name   = "Ec2AdminManageProductionInstances"
  policy = data.aws_iam_policy_document.Ec2AdminManageProduction.json
}

resource "aws_iam_group_membership" "this" {
  group = aws_iam_group.ec2admins.name
  users = [aws_iam_user.dave.name]
  name  = "${aws_iam_user.dave.name}-${aws_iam_group.ec2admins.name}-membership"
}

resource "aws_iam_group_policy_attachment" "this" {
  group      = aws_iam_group.ec2admins.name
  policy_arn = aws_iam_policy.Ec2AdminManageProduction.arn
}

resource "aws_iam_user_login_profile" "dave" {
  user            = aws_iam_user.dave.name
  password_length = 16
}

resource "aws_instance" "this" {
  for_each      = toset(["Production", "Development"])
  ami           = "ami-093467ec28ae4fe03"
  instance_type = "t2.small"
  tags = {
    "Environment" = each.key
    "Name"        = each.key
  }
}
