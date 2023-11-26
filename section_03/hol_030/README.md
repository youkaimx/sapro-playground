# README: Using role-based access control

- Create a user `joanne` in the `Billing Admins` group and access to the console
- The `Billing Admins` group should have attached a managed policy called the `Billing`
- Login into the console as `joanne` and check she can't access anything other than the billing related elements of the console

## Notes
- How to use:
  - Make sure you have a default profile for awscli or set the `AWS_PROFILE` environment variable to something meaninful
  - Modify the variable in the `Makefile` to point to your bucket for the state file
  - Issue `make init` to initialize the Terraform environment
  - `make plan` and `make apply` will run `terraform plan` and `terraform apply -auto-approve`
  - `make destroy` will run   `terraform apply -destroy -auto-approve`
- Get the password for `joanne` with `terraform output -json`

## The `Billing` policy
- Get the details of the policy
```shell
$ aws iam list-policies |jq '.Policies[] | select(.PolicyName=="Billing")'
{
  "PolicyName": "Billing",
  "PolicyId": "ANPAIFTHXT6FFMIRT7ZEA",
  "Arn": "arn:aws:iam::aws:policy/job-function/Billing",
  "Path": "/job-function/",
  "DefaultVersionId": "v8",
  "AttachmentCount": 0,
  "PermissionsBoundaryUsageCount": 0,
  "IsAttachable": true,
  "CreateDate": "2016-11-10T17:33:18+00:00",
  "UpdateDate": "2023-07-26T19:58:17+00:00"
}
```
- Get the policy document
```shell
$ aws iam get-policy-version --policy-arn "arn:aws:iam::aws:policy/job-function/Billing" --version-id v8 --output=json
{
    "PolicyVersion": {
        "Document": {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Sid": "VisualEditor0",
                    "Effect": "Allow",
                    "Action": [
                        "account:GetAccountInformation",
                        "aws-portal:*Billing",
                        "aws-portal:*PaymentMethods",
                        "aws-portal:*Usage",
                        "billing:GetBillingData",
                        "billing:GetBillingDetails",
                        "billing:GetBillingNotifications",
                        "billing:GetBillingPreferences",
                        "billing:GetContractInformation",
                        "billing:GetCredits",
                        "billing:GetIAMAccessPreference",
                        "billing:GetSellerOfRecord",
                        "billing:ListBillingViews",
                        "billing:PutContractInformation",
                        "billing:RedeemCredits",
                        "billing:UpdateBillingPreferences",
                        "billing:UpdateIAMAccessPreference",
                        "budgets:ModifyBudget",
                        "budgets:ViewBudget",
                        "ce:CreateNotificationSubscription",
                        "ce:CreateReport",
                        "ce:DeleteNotificationSubscription",
                        "ce:DeleteReport",
                        "ce:ListCostAllocationTags",
                        "ce:UpdateCostAllocationTagsStatus",
                        "ce:UpdateNotificationSubscription",
                        "ce:UpdatePreferences",
                        "ce:UpdateReport",
                        "consolidatedbilling:GetAccountBillingRole",
                        "consolidatedbilling:ListLinkedAccounts",
                        "cur:DeleteReportDefinition",
                        "cur:DescribeReportDefinitions",
                        "cur:GetClassicReport",
                        "cur:GetClassicReportPreferences",
                        "cur:GetUsageReport",
                        "cur:ModifyReportDefinition",
                        "cur:PutClassicReportPreferences",
                        "cur:PutReportDefinition",
                        "cur:ValidateReportDestination",
                        "freetier:GetFreeTierAlertPreference",
                        "freetier:GetFreeTierUsage",
                        "freetier:PutFreeTierAlertPreference",
                        "invoicing:GetInvoiceEmailDeliveryPreferences",
                        "invoicing:GetInvoicePDF",
                        "invoicing:ListInvoiceSummaries",
                        "invoicing:PutInvoiceEmailDeliveryPreferences",
                        "payments:CreatePaymentInstrument",
                        "payments:DeletePaymentInstrument",
                        "payments:GetPaymentInstrument",
                        "payments:GetPaymentStatus",
                        "payments:ListPaymentPreferences",
                        "payments:MakePayment",
                        "payments:UpdatePaymentPreferences",
                        "purchase-orders:AddPurchaseOrder",
                        "purchase-orders:DeletePurchaseOrder",
                        "purchase-orders:GetPurchaseOrder",
                        "purchase-orders:ListPurchaseOrderInvoices",
                        "purchase-orders:ListPurchaseOrders",
                        "purchase-orders:ListTagsForResource",
                        "purchase-orders:ModifyPurchaseOrders",
                        "purchase-orders:TagResource",
                        "purchase-orders:UntagResource",
                        "purchase-orders:UpdatePurchaseOrder",
                        "purchase-orders:UpdatePurchaseOrderStatus",
                        "purchase-orders:ViewPurchaseOrders",
                        "tax:BatchPutTaxRegistration",
                        "tax:DeleteTaxRegistration",
                        "tax:GetExemptions",
                        "tax:GetTaxInheritance",
                        "tax:GetTaxInterview",
                        "tax:GetTaxRegistration",
                        "tax:GetTaxRegistrationDocument",
                        "tax:ListTaxRegistrations",
                        "tax:PutTaxInheritance",
                        "tax:PutTaxInterview",
                        "tax:PutTaxRegistration",
                        "tax:UpdateExemptions"
                    ],
                    "Resource": "*"
                }
            ]
        },
        "VersionId": "v8",
        "IsDefaultVersion": true,
        "CreateDate": "2023-07-26T19:58:17+00:00"
    }
}
```
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
| [aws_iam_group.billingadmins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_user.joanne](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_login_profile.joanne](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_login_profile) | resource |
| [aws_iam_policy.billing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_short_name"></a> [project\_short\_name](#input\_project\_short\_name) | n/a | `string` | `"sapro-c02-hol-030"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_user_password"></a> [user\_password](#output\_user\_password) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
