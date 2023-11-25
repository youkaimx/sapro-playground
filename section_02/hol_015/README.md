# README

- Create a Service Control Policy to limit the ability to instanciate EC2 vms and only allow those of type t2.micro
- The original policy was modified to allow the creation of micro, nano, and small t2 instances
- Funny thing: when changing the type of the instance from small to medium to generate and error, Terraform did not replaced the resource, and allowed the change.
  - If on the other side, you taint the object and apply the change, the deletion of the instance forces creation and induces the error

## Org data
The data source [aws_organizations_organization](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) can give a list of objects with the data for the accounts associated with the organization we belong to.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.26.0 |
| <a name="provider_aws.orgdev"></a> [aws.orgdev](#provider\_aws.orgdev) | 5.26.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_organizations_policy.RequireMicroInstanceType](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy) | resource |
| [aws_organizations_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy_attachment) | resource |
| [aws_iam_policy_document.RequireMicroInstanceType](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_organizations_organization.org](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_short_name"></a> [project\_short\_name](#input\_project\_short\_name) | n/a | `string` | `"sapro-c02-hol-015"` | no |
| <a name="input_target_account"></a> [target\_account](#input\_target\_account) | n/a | `string` | `"dev"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
