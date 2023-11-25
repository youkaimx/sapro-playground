data "aws_organizations_organization" "org" {}

data "aws_organizations_organizational_unit_child_accounts" "accounts" {
  parent_id = data.aws_organizations_organization.org.roots[0].id
}