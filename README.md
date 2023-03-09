# Azure Aware Virtual Network

[![Build Status](https://dev.azure.com/weareretail/Tooling/_apis/build/status/mod_azu_virtual_network?repoName=mod_azu_virtual_network&branchName=master)](https://dev.azure.com/weareretail/Tooling/_build/latest?definitionId=2&repoName=mod_azu_virtual_network&branchName=master)[![Unilicence](https://img.shields.io/badge/licence-The%20Unilicence-green)](LICENCE)

Common Azure Terraform module to create a Virtual Network.

# Usage

```
module "aware_naming" {
  source = "WeAreRetail/naming/azurerm"

  location    = "France Central"
  environment = "DEV"
  project     = "PRJ"
  area        = "master"
}

module "aware_virtual_network" {
    source = "WeAreRetail/virtual-network/azurerm"

    caf_prefixes             = module.aware_naming.resource_prefixes
    resource_group_name      = "My Resource Group"
    address_spaces           = ["10.0.0.0/16"]
    dns_servers              = ["10.0.0.4", "10.0.0.5"]
}
```

<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurecaf"></a> [azurecaf](#requirement\_azurecaf) | >= 1.2.16 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.0.2 |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_spaces"></a> [address\_spaces](#input\_address\_spaces) | Vnet address space. | `list(string)` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_caf_prefixes"></a> [caf\_prefixes](#input\_caf\_prefixes) | Prefixes to use for caf naming. | `list(string)` | `[]` | no |
| <a name="input_custom_location"></a> [custom\_location](#input\_custom\_location) | Custom Location. | `string` | `""` | no |
| <a name="input_description"></a> [description](#input\_description) | Vnet description. | `string` | `""` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | Custom DNS Servers for the vNet | `list(string)` | `[]` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->
