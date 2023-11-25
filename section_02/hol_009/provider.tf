provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = local.default_tags
  }
}

terraform {
  backend "s3" {}
}
