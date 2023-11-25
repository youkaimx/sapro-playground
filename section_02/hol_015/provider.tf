provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = local.default_tags
  }
  profile = "rvaldez-orgmain"
}

provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = local.default_tags
  }
  profile = "ruben-orgdev"
  alias = "orgdev"
}

terraform {
  backend "s3" {}
}
