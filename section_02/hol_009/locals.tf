locals {
  default_tags = {
    Management    = "Terraform"
    Owner         = "RJVE"
    Project       = "Hands-on Lab 9"
    Project_Short = "${var.project_short_name}"
  }
}
