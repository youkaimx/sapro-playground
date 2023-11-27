data "aws_iam_policy_document" "Ec2AdminManageProduction" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:DescribeInstances",
      "ec2:DescribeInstanceStatus"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "ec2:RebootInstances",
      "ec2:StartInstances",
      "ec2:StopInstances"
    ]
    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "aws:PrincipalTag/Department"
      values = [
        "ec2admins"
      ]
    }
    condition {
      test     = "StringEquals"
      variable = "ec2:ResourceTag/Environment"
      values = [
        "Production"
      ]
    }
  }
}
