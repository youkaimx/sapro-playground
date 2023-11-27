data "aws_caller_identity" "current" {}
data "aws_iam_policy" "IAMFullAccess" {
  name = "IAMFullAccess"
}
data "aws_iam_policy_document" "PermissionsBoundary" {
  statement {
    sid       = "IAMAccess" # This is the IAM admin policy
    effect    = "Allow"
    actions   = ["iam:*"]
    resources = ["*"]
  }
  statement {
    sid    = "DenyPermBoundaryIAMPolicyAlteration"
    effect = "Deny"
    actions = [
      "iam:DeletePolicy",
      "iam:DeletePolicyVersion",
      "iam:CreatePolicyVersion",
      "iam:SetDefaultPolicyVersion"
    ]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/${var.permissions_boundary_policy_name}"]
  }
  statement {
    sid    = "DenyRemovalOfPermBoundaryFromAnyUserOrRole"
    effect = "Deny"
    actions = [
      "iam:DeleteUserPermissionsBoundary",
      "iam:DeleteRolePermissionsBoundary"
    ]
    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/*",
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/*"
    ]
    condition {
      test     = "StringEquals"
      variable = "iam:PermissionsBoundary"
      values = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/${var.permissions_boundary_policy_name}"
      ]
    }
  }
  statement {
    sid    = "DenyAccessIfRequiredPermBoundaryIsNotBeingApplied"
    effect = "Deny"
    actions = [
      "iam:PutUserPermissionsBoundary",
      "iam:PutRolePermissionsBoundary"
    ]
    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/*",
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/*"
    ]
    condition {
      test     = "StringNotEquals"
      variable = "iam:PermissionsBoundary"
      values = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/${var.permissions_boundary_policy_name}"
      ]
    }
  }

  statement {
    sid    = "DenyUserAndRoleCreationWithOutPermBoundary"
    effect = "Deny"
    actions = [
      "iam:CreateUser",
      "iam:CreateRole"
    ]
    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/*",
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/*"
    ]
    condition {
      test     = "StringNotEquals"
      variable = "iam:PermissionsBoundary"
      values = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/${var.permissions_boundary_policy_name}"
      ]
    }
  }
}
