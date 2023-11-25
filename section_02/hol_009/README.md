# README

- Create a user `neal` with a password to access the console, and a set of keys to access the API
- Create a group `admins` with an attached managed policy with name `AdministratorAccesss` and add `neal` to the group

## Notes
- The output of the password and the user_key should be marked as sensitive
- To see sensitive outputs, you can either use
  - `terraform output the_sensitive_output` or
  - `terraform output -json`
- The relation between a user and a group is created via a resource [`aws_iam_group_membership`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership). It appears that you can specify a different name for the membership to allow adding users to the group?
- `checkov`` advises not using the policy AdministratorACccess and not having IAM defined users (using SSO or IAM Identity Center)
