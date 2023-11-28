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
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.26.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_group.admins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_login_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_login_profile) | resource |
| [aws_iam_policy.administratoraccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_short_name"></a> [project\_short\_name](#input\_project\_short\_name) | n/a | `string` | `"sapro-c02-hol-009"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_user_key_id"></a> [user\_key\_id](#output\_user\_key\_id) | n/a |
| <a name="output_user_keys"></a> [user\_keys](#output\_user\_keys) | n/a |
| <a name="output_user_password"></a> [user\_password](#output\_user\_password) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
