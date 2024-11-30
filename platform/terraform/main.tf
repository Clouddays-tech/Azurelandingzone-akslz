# Get the current client configuration from the AzureRM provider.
# This is used to populate the root_parent_id variable with the
# current Tenant ID used as the ID for the "Tenant Root Group"
# Management Group.

data "azurerm_client_config" "core" {}

# Declare the Azure landing zones Terraform module
# and provide a base configuration.

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "~> 5.2.0" # change this to your desired version, https://www.terraform.io/language/expressions/version-constraints

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id   = data.azurerm_client_config.core.tenant_id
  root_id          = local.root_id
  root_name        = local.root_name
  library_path     = "${path.root}/lib"
  default_location = local.default_location

  custom_landing_zones = {
    "${var.root_id}-Online-AKS-Zone" = {
      display_name               = "${upper(var.root_id)} Online AKS Zone"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = [data.azurerm_client_config.core.subscription_id]
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-Online-ACA-Zone" = {
      display_name               = "${upper(var.root_id)} Online ACA Zone"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id = "customer_online"
        parameters = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = ["southeastasia", ]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = ["southeastasia", ]
          }
        }
        access_control = {}
      }
    }
  }
}