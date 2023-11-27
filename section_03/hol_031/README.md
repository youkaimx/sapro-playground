# README: Using Attribute-Based Access Control (ABAC)

- Create a user `dave` in the `ec2admins` group and access to the console.
- Tag `dave` with `Department: ec2admins`
- Attach a policy like the one below to dave, but customize it for ec2 instances.
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                    "ec2:DescribeInstances",
                    "ec2:DescribeInstanceStatus",
            ],
            "Resource": "*"
        },

        {
            "Effect": "Allow",
            "Action": [
                "ec2:RebootInstances",
                "ec2:StartInstances",
                "ec2:StopInstances"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:PrincipalTag/Department": "ec2dmins",
                    "ec2:ResourceTag/Environment": "Production"
                }
            }
        }
    ]
}
```
- Create 2 ec2 instances. Tag one with `Environment: Production` and the other one with `Environment: Development`
- Test if `dave` can start, stop and restart the instance with tag `Environment: Production` as he should be able.
- Test if `dave` can not, stop and restart the instance with tag `Environment: Development` as **he should NOT be able.**

## Notes
- Please note that the original Hands On Lab asked for the ability to operate RDS clusters. This was changed to EC2 Instances because the instanciation time is shorter
- Condition keys for EC2: https://docs.aws.amazon.com/service-authorization/latest/reference/list_amazonec2.html#amazonec2-policy-keys
- How to use:
  - Make sure you have a default profile for awscli or set the `AWS_PROFILE` environment variable to something meaninful
  - Modify the variable in the `Makefile` to point to your bucket for the state file
  - Issue `make init` to initialize the Terraform environment
  - `make plan` and `make apply` will run `terraform plan` and `terraform apply -auto-approve`
  - `make destroy` will run   `terraform apply -destroy -auto-approve`
- Get the password for `joanne` with `terraform output -json`
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
| [aws_iam_group.ec2admins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.Ec2AdminManageProduction](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.dave](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_login_profile.dave](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_login_profile) | resource |
| [aws_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_iam_policy_document.Ec2AdminManageProduction](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_short_name"></a> [project\_short\_name](#input\_project\_short\_name) | n/a | `string` | `"sapro-c02-hol-031"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_user_password"></a> [user\_password](#output\_user\_password) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
