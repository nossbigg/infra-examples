# infra-examples

This repository contains various examples of provisioning **cloud infrastructure** with specific use-cases in mind.

# Common Prerequisites

## 1. AWS

- AWS CLI
  - Install CLI: [guide](https://aws.amazon.com/cli/)
  - Configure CLI with API Keys and Profile: [guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
  - Change `provider.profile` in `terraform/provider.tf` to match the name of your own profile

## 2. Terraform

- Terraform CLI
  - Install CLI: [guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)
  - Configure with API Token: [guide](https://www.terraform.io/docs/commands/login.html)
- Terraform Organization + Workspace
  - Create own organization: [guide](https://www.terraform.io/docs/cloud/users-teams-organizations/organizations.html)
  - Update `organization` value in `terraform/state.tf` to own organization name
  - Create workspace with name specific to each example eg. `wildcard-cloudfront`: [guide](https://www.terraform.io/docs/cloud/workspaces/creating.html)
  - Set workspace Execution Mode to `Local`: [guide](https://www.terraform.io/docs/cloud/workspaces/settings.html)
