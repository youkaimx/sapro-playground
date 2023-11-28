# README: Cross Account access to S3

- Create a bucket in one of your accounts
- create a role with
  - a trust policy to allow it to be assummed by an external acccount which also provides an external id and
  - a policy to allow the bucket to list and read (get) objects in the  bucket
- From the (referred previously) external account:
  - Test you can assume the Asumme the role with `aws sts assume-role`
  - Set up your env variables from the previous command output
  - Test your access by listing the bucket contents and to copy an object from the bucket


## Notes

- For the `aws sts assume-role` command, the role name (in ARN) is case sensitive: Consider the following error

```shell
$ aws sts assume-role --role-arn arn:aws:iam::014834224223:role/s3externalaccess --external-id verySecretExternalId --role-session-name this

An error occurred (AccessDenied) when calling the AssumeRole operation: User: arn:aws:iam::787810149840:user/ruben is not authorized to perform: sts:AssumeRole on resource: arn:aws:iam::014834224223:role/s3externalacces
```

But this is correct:

```shell
$ aws sts assume-role --role-arn arn:aws:iam::014834224223:role/S3ExternalAccess --external-id verySecretExternalId --role-session-name this
{
    "Credentials": {
        "AccessKeyId": "ASIAQG5BQJRPVZR7C6EJ",
        "SecretAccessKey": "EZmX1YdZEcawmotpVMSJ1b1GglXfl3m5+qwd9niW",
        "SessionToken": "IQoJb3JpZ2luX2VjEGoaCXVzLXdlc3QtMiJHMEUCIHBpE9NkRqauVqi7rw49HBmWb5cilvnMa1j3+DbZST9nAiEA7MI4XlmBnDgadKG/5DSEqiZ24lBYQZFpR8nLsslDd1kqmgIIw///////////ARACGgwwMTQ4MzQyMjQyMjMiDJiHmRrdtfaSwVk9OiruAY46Vc1p9nmrzMWJsIxOQiwJTMDw6MLDhx9HvX6sG7MaHNVj6cYFEQ5VO81mES9D0BPWPqFL3Etz3khwP0xo7XC5KmaZb/fc64mjHLuUAeUMEv0QIUu4TY/XcARGMXg5a7/KSs7FE0XEXrNfGtmGMKz1DjmL3Mwu4lQIb7vA5OhNSsJKJQf/1lghzU5SVn8Ir4W+O0Ya7WVKBB3dS6aA4aE2ItcdlSWVt9MfjjYPJaGLN6Ux6qTXPOAKpqReH0WH1SH2NVcfUhgVSneOQ1FaE3hxf8a+qX3rQqPQ+CdfBAn8amF1fUxGWKXfdjbXZZEwwNOYqwY6nQExIrL0V01zuNRSZjkbLjjNriPE+h64ZfCve7b0RN2yt5unqUK6xN24yVWOsySlFkjF77rqW+2YXGv/LmTU61wOexUdebI9iAgZe7WnhVwDMscqhAHMjA9r6ycnEjWNvDEkmbdEVBb5G1VDDysMszjHzq1R0Wo9xabdcNzoazo+Sxu4pmX5IvHFfwGgFaalNXu30+rPE3UASMBrhmsc",
        "Expiration": "2023-11-28T18:56:16+00:00"
    },
    "AssumedRoleUser": {
        "AssumedRoleId": "AROAQG5BQJRPU4LJ74GFX:this",
        "Arn": "arn:aws:sts::014834224223:assumed-role/S3ExternalAccess/this"
    }
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.27.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.s3_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.external_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.external_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_bucket.mybucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_iam_policy_document.s3_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trust_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_short_name"></a> [project\_short\_name](#input\_project\_short\_name) | n/a | `string` | `"sapro-c02-hol-034"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
