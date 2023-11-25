locals {
  default_tags = {
    Management    = "Terraform"
    Owner         = "RJVE"
    Project       = "Hands-on Lab 15"
    Project_Short = "${var.project_short_name}"
  }
  # for expressions
  # https://developer.hashicorp.com/terraform/language/expressions/for
  target_account = { for acc in data.aws_organizations_organization.org.accounts : acc.name => acc.id if acc.name == var.target_account }
}

variable target_account {
  type = string
  default = "dev"
}