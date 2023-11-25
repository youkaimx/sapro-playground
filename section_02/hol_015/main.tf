# aws_iam_policy_document
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document
data "aws_iam_policy_document" "RequireMicroInstanceType" {
  statement {
    effect    = "Deny"
    actions   = ["ec2:RunInstances"]
    resources = ["arn:aws:ec2:*:*:instance/*"]
    condition {
      test     = "StringNotEquals"
      variable = "ec2:InstanceType"
      values = [
        "t2.micro",
        "t2.nano",
        "t2.small"
      ]
    }
  }
}

resource "aws_organizations_policy" "RequireMicroInstanceType" {
  name    = "RequireT2Micro"
  content = data.aws_iam_policy_document.RequireMicroInstanceType.json
  type    = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "this" {
  policy_id = aws_organizations_policy.RequireMicroInstanceType.id
  target_id = local.target_account.dev
}

resource "aws_instance" "this" {
  ami           = "ami-093467ec28ae4fe03"
  instance_type = "t2.small"
  provider      = aws.orgdev
}
