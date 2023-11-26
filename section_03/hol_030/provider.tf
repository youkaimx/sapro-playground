provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = local.default_tags
  }
  profile = "personal"
}

terraform {
  backend "s3" {}
}
