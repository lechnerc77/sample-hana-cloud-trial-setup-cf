# Sample setup of SAP HANA Cloud with HDI container using Terraform on SAP BTP trial

This repository contains a sample setup of SAP HANA Cloud (including HDI container) using Terraform on SAP BTP trial.

The repository requires the following setup on SAP BTP trial:

- A global account (GA) on SAP BTP trial
- A subaccount on SAP BTP trial
- An org in Cloud Foundry (CF) on SAP BTP trial
- A space in CF on SAP BTP trial
- The entitlements for "SAP HANA Cloud", "SAP HANA Cloud Tools" and HDI container assigned to the subaccount

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_btp"></a> [btp](#requirement\_btp) | ~> 1.16.1 |
| <a name="requirement_cloudfoundry"></a> [cloudfoundry](#requirement\_cloudfoundry) | ~> 1.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_btp"></a> [btp](#provider\_btp) | 1.16.1 |
| <a name="provider_cloudfoundry"></a> [cloudfoundry](#provider\_cloudfoundry) | 1.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [btp_subaccount_role_collection_assignment.hana_cloud_admin](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_role_collection_assignment) | resource |
| [btp_subaccount_subscription.hana_cloud_tools](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_subscription) | resource |
| [cloudfoundry_service_instance.hana__hdi_shared](https://registry.terraform.io/providers/cloudfoundry/cloudfoundry/latest/docs/resources/service_instance) | resource |
| [cloudfoundry_service_instance.hana_cloud_trial__hana](https://registry.terraform.io/providers/cloudfoundry/cloudfoundry/latest/docs/resources/service_instance) | resource |
| [cloudfoundry_service_plan.hana__hdi_shared](https://registry.terraform.io/providers/cloudfoundry/cloudfoundry/latest/docs/data-sources/service_plan) | data source |
| [cloudfoundry_service_plan.hana_cloud_trial__hana](https://registry.terraform.io/providers/cloudfoundry/cloudfoundry/latest/docs/data-sources/service_plan) | data source |
| [cloudfoundry_space.space](https://registry.terraform.io/providers/cloudfoundry/cloudfoundry/latest/docs/data-sources/space) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_url"></a> [api\_url](#input\_api\_url) | The API URL for the Cloud Foundry instance. | `string` | n/a | yes |
| <a name="input_globalaccount"></a> [globalaccount](#input\_globalaccount) | The subdomain of the SAP BTP global account. | `string` | n/a | yes |
| <a name="input_hana_cloud_admins"></a> [hana\_cloud\_admins](#input\_hana\_cloud\_admins) | List of users to be assigned the SAP HANA Cloud Administrator role. | `list(string)` | `[]` | no |
| <a name="input_hana_cloud_system_password"></a> [hana\_cloud\_system\_password](#input\_hana\_cloud\_system\_password) | The password for the HANA Cloud system user. Needs to be longer than 8 characters. | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The ID of the Cloud Foundry organization where resources will be created. | `string` | n/a | yes |
| <a name="input_space_name"></a> [space\_name](#input\_space\_name) | The name of the Cloud Foundry space where resources will be created. | `string` | n/a | yes |
| <a name="input_subaccount_id"></a> [subaccount\_id](#input\_subaccount\_id) | The ID of the SAP BTP subaccount where resources will be created. | `string` | n/a | yes |

## Outputs

No outputs.
