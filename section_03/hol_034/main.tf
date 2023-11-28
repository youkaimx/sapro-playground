resource "aws_s3_bucket" "mybucket" {
  bucket = var.project_short_name
}

resource "aws_iam_role" "external_access" {
  name               = "S3ExternalAccess"
  assume_role_policy = data.aws_iam_policy_document.trust_policy.json
}

resource "aws_iam_policy" "s3_read" {
  name   = "S3Read-${var.project_short_name}"
  policy = data.aws_iam_policy_document.s3_read.json
}

resource "aws_iam_role_policy_attachment" "external_access" {
  policy_arn = aws_iam_policy.s3_read.arn
  role       = aws_iam_role.external_access.id
}
