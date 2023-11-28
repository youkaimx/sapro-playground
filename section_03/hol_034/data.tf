data "aws_iam_policy_document" "trust_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type = "AWS"
      identifiers = [
        "787810149840"
      ]
    }
    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values = [
        "verySecretExternalId"
      ]
    }
  }
}

data "aws_iam_policy_document" "s3_read" {
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject"
    ]
    resources = [
      "${aws_s3_bucket.mybucket.arn}/*"
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket"
    ]
    resources = [
      "${aws_s3_bucket.mybucket.arn}"
    ]
  }
}
