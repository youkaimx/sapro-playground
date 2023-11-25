# README

- Create a Service Control Policy to limit the ability to instanciate EC2 vms and only allow those of type t2.micro
- The original policy was modified to allow the creation of micro, nano, and small t2 instances
- Funny thing: when changing the type of the instance from small to medium to generate and error, Terraform did not replaced the resource, and allowed the change.
  - If on the other side, you taint the object and apply the change, the deletion of the instance forces creation and induces the error

## Org data
The data source [aws_organizations_organization](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) can give a list of objects with the data for the accounts associated with the organization we belong to.
