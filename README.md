# terraform-azuread-application-link

This module creates an enterprise application in an Azure AD tenant that links to an endpoint.  The resulting enterprise application is added to the MyApps portal for the assigned users/groups.  This module does not support enabling authentication.  If the endpoint is already authenticated or can authenticate via SSO to Azure AD, then it supports that transparently.

The use case for this was realized linking to an application endpoint in AWS which was already linked via SSO.  This permits the users to enter direclty into the applicaiton rather than navigating through the AWS Management Console.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 2.15 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.41.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.4.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Resources

| Name | Type |
|------|------|
| [azuread_app_role_assignment.assignments](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/app_role_assignment) | resource |
| [azuread_application.link](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_service_principal.link](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [random_uuid.app_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |
| [azuread_groups.groups](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/groups) | data source |
| [azuread_users.users](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/users) | data source |
| [http_http.logo](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the application | `string` | n/a | yes |
| <a name="input_url"></a> [url](#input\_url) | The URL of the application | `string` | n/a | yes |
| <a name="input_group_names"></a> [group\_names](#input\_group\_names) | The group display names to assign to the application.  Can be used with `user_principal_names` to assign both users and groups to the application. | `list(string)` | `[]` | no |
| <a name="input_logo_url"></a> [logo\_url](#input\_logo\_url) | The URL of the application logo | `string` | `""` | no |
| <a name="input_requires_assignment"></a> [requires\_assignment](#input\_requires\_assignment) | If "false", users/groups do not need assignment to the application as it will be visible to all users in the directory. | `bool` | `true` | no |
| <a name="input_user_principal_names"></a> [user\_principal\_names](#input\_user\_principal\_names) | The user principal names to assign to the application.  Can be used with `group_names` to assign both users and groups to the application. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_id"></a> [application\_id](#output\_application\_id) | n/a |
| <a name="output_assignments"></a> [assignments](#output\_assignments) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_logo_url"></a> [logo\_url](#output\_logo\_url) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_tenant_id"></a> [tenant\_id](#output\_tenant\_id) | n/a |
| <a name="output_url"></a> [url](#output\_url) | n/a |
<!-- END_TF_DOCS -->