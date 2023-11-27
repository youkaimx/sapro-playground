# README: Applying a Permissions Boundary
- Create a user `lindsay` with access to the console
- Attach the managed policy `IAMFullAccess` to lindsay
- Use the `PermissionsBoundary.json` file to create a policy that will serve as a permissions boundary for `lindsay` so
  - IAM principals can't alter the permissions boundary to allow their own permissions to access restricted services
  - IAM princpials must attach the permissions boundary to any IAM principals they create
  - IAM principals can't create IAM principals with more privileges than they already have
- Login to the console as `lindsay` and check
  -  `lindsay` cannot remove the permissions boundary
  -  `lindsay` cannot create a user without the permissions boundary
  - Note that lindsay can attach a policy to user with more privileges than she has but the permissions boundary applied to the user would restrict the enactment of such privileges

## Acknowledgements
The entire repo is an attempt to "terraform-ize" the Systems Architect Pro course by Neal Davis. As such, it uses some code he wrote. In this specific Hands on Lab, we use [`PermissionsBoundary.json`](./PermissionsBoundary.json)
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
| [aws_iam_policy.PermissionsBoundary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_user.lindsay](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_login_profile.lindsay](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_login_profile) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy.IAMFullAccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy_document.PermissionsBoundary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_permissions_boundary_policy_name"></a> [permissions\_boundary\_policy\_name](#input\_permissions\_boundary\_policy\_name) | n/a | `string` | `"PermissionsBoundary"` | no |
| <a name="input_project_short_name"></a> [project\_short\_name](#input\_project\_short\_name) | n/a | `string` | `"sapro-c02-hol-032"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_user_password"></a> [user\_password](#output\_user\_password) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
